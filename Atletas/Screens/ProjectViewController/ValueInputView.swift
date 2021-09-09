//
//  ValueInputView.swift
//  Atletas
//
//  Created by André Schueda on 09/09/21.
//

import UIKit

class ValueInputView: UIView {
    var currentValue: Int = 10
    
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
        button.addTarget(self, action: #selector(clickedMinus), for: .touchUpInside)
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
        field.text = "\(10)"
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
        button.addTarget(self, action: #selector(clickedPlus), for: .touchUpInside)
        return button
    }()
    
    @objc func clickedPlus() {
        currentValue += 1
        inputField.text = "\(currentValue)"
    }
    
    @objc func clickedMinus() {
        currentValue = currentValue == 1 ? 1 : currentValue - 1
        inputField.text = "\(currentValue)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupMinusButton()
        setupCurrencyLabel()
        setupInputField()
        setupPlusButton()
        
    }
    
    func setupMinusButton() {
        addSubview(minusButton)
        minusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalToSuperview()
        }
    }
    
    func setupCurrencyLabel() {
        addSubview(currencyLabel)
        currencyLabel.snp.makeConstraints { make in
            make.leading.equalTo(minusButton.snp.trailing).offset(16)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupInputField() {
        addSubview(inputField)
        inputField.snp.makeConstraints { make in
            make.leading.equalTo(currencyLabel.snp.trailing).offset(2)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupPlusButton() {
        addSubview(plusButton)
        plusButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalTo(inputField.snp.trailing).offset(16)
            make.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}