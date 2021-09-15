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
    weak var supporter: Supporter?
    weak var project: Project?
    var status: DonationStatusEnum

    var dateString: String {
        self.date.toDayMonthYearString()
    }
    var date: Date
    
    init(receiptImage: UIImage?, supporter: Supporter?, supporterAmount: Double, athleteAmount: Double, status: DonationStatusEnum, project: Project?) {
        self.receiptImage = receiptImage
        self.supporterAmount = supporterAmount
        self.athleteAmount = athleteAmount
        self.status = status
        
        self.supporter = supporter
        self.project = project

        self.date = Date()
    }

    func clone() -> Donation {
        return Donation(receiptImage: receiptImage, supporter: supporter, supporterAmount: supporterAmount, athleteAmount: athleteAmount, status: status, project: project)
    }
}
