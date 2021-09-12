//
//  ConfirmDonationButtonsView.swift
//  Atletas
//
//  Created by André Schueda on 11/09/21.
//

import UIKit

class ConfirmDonationButtonsView: UIStackView {
    let donationRepository: DonationRepository = fakeDonationRepository()
    
    var navigationController: UINavigationController?
    var receipt: UIImage?
    var donationValue: Double?
    
    lazy var laterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.setTitle("Mais Tarde", for: .normal)
        button.setTitleColor(UIColor(named: "laterButtonFont"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        button.backgroundColor = UIColor(named: "laterButton")
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
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
    
    @objc func clickedButton() {
        navigationController?.dismiss(animated: true, completion: nil)
        donationRepository.saveDonation(from: Supporter(name: "André Schueda", username: "schueda", password: "alksjd"),
                                        to: Athlete(name: "Mayra Sayuri", username: "sayurii", password: "alsjdkajlsd", image: UIImage(), about: "bla bla bla", category: .brazilianTeam, contact: "41 99119831", pixKey: "1302091012", city: "Curitiba", socialMedia: SocialMedia(instagram: "@sayuri.mayra", facebook: "Mayra Sayuri", twitter: "@sayuri.mayra"), sport: .softball),
                                        receipt: receipt,
                                        value: donationValue ?? 0)
    }
}
