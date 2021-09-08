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
            make.height.equalTo(175)
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

    lazy var pixCodeView: PixCodeView = {
        let view = PixCodeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var valueInstructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Informe abaixo o valor de sua doação:"
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(for: .footnote, weight: .regular)
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
        
        [
            self.imageView,
            self.infoView,
            self.instructionLabel,
            self.pixCodeView,
            self.valueInstructionLabel,
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
        
        pixCodeView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
