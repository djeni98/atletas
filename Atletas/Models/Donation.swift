//
//  Donation.swift
//  Donation
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation
import UIKit

class Donation {
    var receiptImage: UIImage?
    let supporterAmount: Double
    let athleteAmount: Double
    var supporter: String
    var project: String
    var status: DonationStatusEnum

    let dateString: String
    let date: Date
    
    init(receiptImage: UIImage?, supporter: String, supporterAmount: Double, athleteAmount: Double, status: DonationStatusEnum, project: String) {
        self.receiptImage = receiptImage
        self.supporterAmount = supporterAmount
        self.athleteAmount = athleteAmount
        self.status = status
        
        self.supporter = supporter
        self.project = project

        self.date = Date()
        self.dateString = self.date.toDayMonthYearString()
    }

    func clone() -> Donation {
        return Donation(receiptImage: receiptImage, supporter: supporter, supporterAmount: supporterAmount, athleteAmount: athleteAmount, status: status, project: project)
    }
}
