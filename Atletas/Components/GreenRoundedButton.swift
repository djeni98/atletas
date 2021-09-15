//
//  GreenRoundedButton.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 04/09/21.
//

import UIKit

class GreenRoundedButton: UIButton {
    static let fixedHeight: CGFloat = 50
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let height = GreenRoundedButton.fixedHeight
        self.layer.cornerRadius = height / 2
        self.layer.backgroundColor = UIColor(named: "ButtonGreen")?.cgColor
    }

    static func getSupportButton() -> GreenRoundedButton {
        let button = GreenRoundedButton()

        button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        button.setTitle("Apoiar".uppercased(), for: .normal)
        button.setTitleColor(UIColor(named: "ButtonGreenFont"), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false

        let width: CGFloat = 150
        button.snp.makeConstraints { make in
            make.height.equalTo(fixedHeight)
            make.width.equalTo(width)
        }

        return button
    }
    static func getBuyButton() -> GreenRoundedButton {
        let button = GreenRoundedButton()

        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        button.setTitle("Comprar Modelo 3D", for: .normal)
        button.setTitleColor(UIColor(.black), for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false

        let width: CGFloat = 285
        button.snp.makeConstraints { make in
            make.height.equalTo(fixedHeight)
            make.width.equalTo(width)
        }

    return button
}
}
