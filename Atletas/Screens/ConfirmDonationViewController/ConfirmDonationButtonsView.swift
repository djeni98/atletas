//
//  ConfirmDonationButtonsView.swift
//  Atletas
//
//  Created by André Schueda on 11/09/21.
//

import UIKit

class ConfirmDonationButtonsView: UIStackView {
    
    lazy var laterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.setTitle("Mais Tarde", for: .normal)
        button.setTitleColor(UIColor(named: "laterButtonFont"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        button.backgroundColor = UIColor(named: "laterButton")
        return button
    }()

    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.setTitle("Enviar", for: .normal)
        button.setTitleColor(UIColor(named: "greenButtonText"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        button.backgroundColor = UIColor(named: "ButtonGreen")
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [
            laterButton,
            sendButton
        ].forEach { self.addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
