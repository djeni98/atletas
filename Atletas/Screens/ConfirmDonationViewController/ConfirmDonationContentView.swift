//
//  ConfirmDonationContentView.swift
//  Atletas
//
//  Created by André Schueda on 11/09/21.
//

import UIKit

class ConfirmDonationContentView: UIView {
    var donationValue: Double?
    
    var navigationController: UINavigationController? {
        didSet {
            receiptView.navigationController = self.navigationController
        }
    }
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Obrigado por apoiar o esporte!"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    lazy var receiptView: ReceiptView = {
        let view = ReceiptView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var sendButton: GreenRoundedButton = {
        let button = GreenRoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enviar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        button.setTitleColor(UIColor(named: "laterButtonFont"), for: .disabled)
        button.setTitleColor(UIColor(named: "greenButtonText"), for: .normal)
        button.backgroundColor = UIColor(named: "laterButton")
        button.isEnabled = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupSubtitleLabel()
        setupReceiptView()
        setupSendButton()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubtitleLabel() {
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setupReceiptView() {
        addSubview(receiptView)
        receiptView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        receiptView.contentView = self
    }
    
    func setupSendButton() {
        addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(receiptView.snp.bottom).offset(25)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
}
