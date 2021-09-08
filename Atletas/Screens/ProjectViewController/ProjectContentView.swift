//
//  ProjectContentView.swift
//  Atletas
//
//  Created by André Schueda on 05/09/21.
//

import UIKit

class ProjectContentView: UIView {

    lazy var imageView: ProjectImageView = {
        let view = ProjectImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.alignment = .center
        [
            self.infoView,
            self.instructionLabel,
            self.pixCodeLabel,
            self.testButton
        ].forEach { stack.addArrangedSubview($0) }
        return stack
    }()

    lazy var infoView: SupportedInfoView = {
        let view = SupportedInfoView()
        view.layer.borderColor = UIColor(named: "ButtonGreen")?.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copie o código abaixo e utilize o Pix Copia e Cola no aplicativo que você vai fazer o pagamento:"
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(for: .footnote, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    lazy var pixCodeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "000.000.000-99"
        label.font = UIFont.preferredFont(for: .headline, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var testButton: GreenRoundedButton = {
        let label = GreenRoundedButton.getSupportButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupImageView()
        setupStackView()
    }

    func setupImageView() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.height.equalTo(UIScreen.main.bounds.size.height * 0.20)
        }
    }
    
    func setupStackView() {
        addSubview(contentStackView)
        contentStackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
}
