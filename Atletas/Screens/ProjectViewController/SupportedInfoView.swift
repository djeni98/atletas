//
//  SupportedInfoView.swift
//  Atletas
//
//  Created by André Schueda on 06/09/21.
//

import UIKit

class SupportedInfoView: UIView {
    var athleteName: String? {
        didSet {
            nameLabel.attributedText = makeAttributedString(regular: "Nome: ", bold: athleteName?.uppercased())
        }
    }
    
    var athleteCpf: String? {
        didSet {
            cpfLabel.attributedText = makeAttributedString(regular: "CPF: ", bold: athleteCpf)
        }
    }
    
    var athleteBank: String? {
        didSet {
            bankLabel.attributedText = makeAttributedString(regular: "Instituição: ", bold: athleteBank)
        }
    }

    
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dados de quem receberá sua doação:"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    lazy var cpfLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    lazy var bankLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .left
        return label
    }()
    
    func makeAttributedString(regular: String, bold: String?) -> NSMutableAttributedString {
        let regularString = NSMutableAttributedString(string: regular)
        
        guard let boldText = bold else { return regularString }
        let attributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .semibold)]
        let attributedString = NSMutableAttributedString(string: boldText, attributes: attributes)
        
        regularString.append(attributedString)
        return regularString
    }
    
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
