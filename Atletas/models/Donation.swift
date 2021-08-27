//
//  Donation.swift
//  Donation
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation
import UIKit

class Donation {
    
    var receiptImage: UIImage
    let supporter: String
    let supporterAmount: Double
    let athleteAmount: Double
    var status: DonationStatusEnum
    
    init(receiptImage: UIImage, supporter: String, supporterAmount: Double, athleteAmount: Double, status: DonationStatusEnum) {
        self.receiptImage = receiptImage
        self.supporter = supporter
        self.supporterAmount = supporterAmount
        self.athleteAmount = athleteAmount
        self.status = status
    }
}
