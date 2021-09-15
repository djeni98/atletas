//
//  ProjectContentView.swift
//  Atletas
//
//  Created by André Schueda on 05/09/21.
//

import UIKit

class ProjectContentView: UIStackView {
    var nav: UINavigationController?
    var project: Project?

    lazy var imageView: ProjectImageView = {
        let view = ProjectImageView()
        view.imageName = "???"
        view.projectName = "Sul Americano 2022"
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
        view.athleteName = "Mayra Sayuri"
        view.athleteCpf = "***.999.***-**"
        view.athleteBank = "Banco Do Brasil"
        return view
    }()
    
    lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Copie o código abaixo e utilize o Pix Copia e Cola no aplicativo que você vai fazer o pagamento:"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var pixCodeView: PixCodeView = {
        let view = PixCodeView()
        view.pixCode = "999.999.999-00"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var valueInstructionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Informe abaixo o valor de sua doação:"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var valueInput: ValueInputView = {
        let view = ValueInputView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var confirmButton: GreenRoundedButton = {
        let button = GreenRoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Prosseguir", for: .normal)
        button.setTitleColor(UIColor(named: "greenButtonText"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        button.addTarget(self, action: #selector(confirmButtonClicked), for: .touchUpInside)
        return button
    }()
    
    @objc func confirmButtonClicked() {
        let viewController = ConfirmDonationViewController()
        viewController.donationValue = Double(valueInput.currentValue)
        nav?.pushViewController(viewController, animated: true)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        [
            self.imageView,
            self.infoView,
            self.instructionLabel,
            self.pixCodeView,
            self.valueInstructionLabel,
            self.valueInput,
            self.confirmButton
        ].forEach { self.addArrangedSubview($0) }
        
        imageView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        infoView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16).priority(.high)
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        pixCodeView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        valueInput.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().offset(-44)
            make.height.equalTo(50)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with project: Project) {
        self.project = project
        imageView.imageView.image = project.image
        imageView.projectName = project.title

        guard let athlete = project.athlete else { return }

        if project.isMonthlyProject {
            imageView.athleteName = athlete.name
        }

        infoView.athleteName = athlete.name
        infoView.athleteCpf = athlete.pixInfo.getMaskedCpf()
        infoView.athleteBank = athlete.pixInfo.bank

        pixCodeView.pixCode = athlete.pixInfo.key
    }
}
