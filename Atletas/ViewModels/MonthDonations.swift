//
//  MonthDonations.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import Foundation

class MonthDonations {
    let month: String
    let donations: [Donation]
    
    init(month: String, donations: [Donation]) {
        self.month = month
        self.donations = donations
    }
}
