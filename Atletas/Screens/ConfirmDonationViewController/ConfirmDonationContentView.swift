//
//  ConfirmDonationContentView.swift
//  Atletas
//
//  Created by André Schueda on 11/09/21.
//

import UIKit

class ConfirmDonationContentView: UIView {
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
    
    lazy var buttonsView: ConfirmDonationButtonsView = {
        let stackView = ConfirmDonationButtonsView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 25
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupSubtitleLabel()
        setupReceiptView()
        setupButtonsView()
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
    }
    
    func setupButtonsView() {
        addSubview(buttonsView)
        buttonsView.snp.makeConstraints { make in
            make.top.equalTo(receiptView.snp.bottom).offset(25)
            make.height.equalTo(44)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview()
        }
    }
}
