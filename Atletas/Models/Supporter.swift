//
//  Supporter.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import Foundation

class Supporter: User {
    var name: String
    var badges: [Badge] = []
    var donations: [Donation] = []
    var level: LevelEnum = .noLevel

    init(name: String, username: String, password: String) {
        self.name = name
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
