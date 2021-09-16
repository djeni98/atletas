//
//  Supporter.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import UIKit

class Supporter: User {
    var name: String
    var achievedBadges: [String:Bool] = [:]
    var donations: [Donation] = []
    var level: LevelEnum = .noLevel
    var image: UIImage?

    init(name: String, username: String, password: String, image: UIImage? = nil) {
        self.name = name
        self.image = image
        super.init(username: username, password: password, type: .supporter)
        
        for badge in BadgesDataModule.shared.badges {
            achievedBadges[badge.objectName] = (0.5 > Double.random(in: 0...1))
        }
    }
    
    func getDonationsByMonth() -> [String:[Donation]] {
        var dict: [String:[Donation]] = [:]
        for donation in donations {
            let yearAndMonth = "\(donation.date.get(.year))/\(donation.date.get(.month))"
            
            if dict[yearAndMonth] == nil {
                dict[yearAndMonth] = [donation]
            } else {
                dict[yearAndMonth]?.append(donation)
            }
        }
        
        return dict
    }
}
