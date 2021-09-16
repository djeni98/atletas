//
//  Supporter.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import UIKit

class Supporter: User {
    var name: String
    var badges: [Badge] = []
    var donations: [Donation] = []
    var level: LevelEnum = .noLevel
    var image: UIImage?

    init(name: String, username: String, password: String, image: UIImage? = nil) {
        self.name = name
        self.image = image
        super.init(username: username, password: password, type: .supporter)
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
