//
//  ProjectContentView.swift
//  Atletas
//
//  Created by André Schueda on 05/09/21.
//

import UIKit

class ProjectContentView: UIStackView {

    lazy var imageView: ProjectImageView = {
        let view = ProjectImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.snp.makeConstraints { make in
            make.height.equalTo(UIScreen.main.bounds.size.height * 0.20)
        }
        return view
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
//        setupImageView()
        [
            self.imageView,
            self.infoView,
            self.instructionLabel,
            self.pixCodeLabel,
            self.testButton
        ].forEach { self.addArrangedSubview($0) }
        
        imageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setupImageView() {
//        addSubview(imageView)
//        imageView.snp.makeConstraints { make in
//            make.top.equalTo(safeAreaLayoutGuide.snp.top)
//            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
//            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
//            make.height.equalTo(UIScreen.main.bounds.size.height * 0.20)
//        }
//    }
    
//    func setupStackView() {
//        addSubview(contentStackView)
//        contentStackView.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(16)
//            make.leading.equalToSuperview().offset(22)
//            make.trailing.equalToSuperview().offset(-22)
//            make.bottom.equalToSuperview().offset(-32)
//        }
//    }
}
