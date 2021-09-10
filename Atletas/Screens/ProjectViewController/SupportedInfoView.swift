//
//  SupportedInfoView.swift
//  Atletas
//
//  Created by André Schueda on 06/09/21.
//

import UIKit

class SupportedInfoView: UIView {
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Dados de quem receberá sua doação:"
        label.font = UIFont.preferredFont(for: .subheadline, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome:"
        label.font = UIFont.preferredFont(for: .subheadline, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    lazy var cpfLabel: UILabel = {
        let label = UILabel()
        label.text = "CPF:"
        label.font = UIFont.preferredFont(for: .subheadline, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    lazy var bankLabel: UILabel = {
        let label = UILabel()
        label.text = "Instituição:"
        label.font = UIFont.preferredFont(for: .subheadline, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTitleLabel()
        setupNameLabel()
        setupCpfLabel()
        setupBankLabel()
    }

    func setupTitleLabel() {
        addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
    
    func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
    
    func setupCpfLabel() {
        addSubview(cpfLabel)
        cpfLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
    
    func setupBankLabel() {
        addSubview(bankLabel)
        bankLabel.snp.makeConstraints { make in
            make.top.equalTo(cpfLabel.snp.bottom)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
}
