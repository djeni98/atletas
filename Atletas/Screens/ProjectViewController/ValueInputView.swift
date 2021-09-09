//
//  ValueInputView.swift
//  Atletas
//
//  Created by André Schueda on 09/09/21.
//

import UIKit

class ValueInputView: UIView {
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(UIColor(named: "changeValueFont"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(named: "changeValueButton")?.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.text = "R$:"
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var inputField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .none
        field.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        field.text = "10"
        field.isUserInteractionEnabled = true
        return field
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle(" + ", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.setTitleColor(UIColor(named: "changeValueFont"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderColor = UIColor(named: "changeValueButton")?.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCurrencyLabel()
        setupInputField()
        setupMinusButton()
        setupPlusButton()
        
    }
    
    func setupCurrencyLabel() {
        addSubview(currencyLabel)
        currencyLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self.snp.centerX).offset(-2)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupInputField() {
        addSubview(inputField)
        inputField.snp.makeConstraints { make in
            make.leading.equalTo(self.snp.centerX).offset(2)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupMinusButton() {
        addSubview(minusButton)
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.trailing.equalTo(currencyLabel.snp.leading).offset(-16)
        }
    }
    
    func setupPlusButton() {
        addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalTo(inputField.snp.trailing).offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
