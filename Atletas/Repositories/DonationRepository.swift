//
//  DonationRepository.swift
//  Atletas
//
//  Created by André Schueda on 12/09/21.
//

import Foundation
import UIKit

protocol DonationRepository {
    func saveDonation(from: Supporter, to: Athlete, receipt: UIImage?, value: Double)
    func listDonations(from: Supporter) -> [Donation]
    func listDonations(to: Project) -> [Donation]
    func listDonations(to: Athlete) -> [Donation]
}

class fakeDonationRepository: DonationRepository {
    func saveDonation(from supporter: Supporter, to athlete: Athlete, receipt: UIImage?, value: Double) {
        print("\(supporter.name) doou \(value) para \(athlete.name)")
        print(receipt as Any)
    }
    
    func listDonations(from: Supporter) -> [Donation] {
        []
    }
    
    func listDonations(to: Project) -> [Donation] {
        []
    }
    
    func listDonations(to: Athlete) -> [Donation] {
        []
    }
}
