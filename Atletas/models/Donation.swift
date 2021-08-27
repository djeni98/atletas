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
    let supporterSaysThisAmount: Double
    let athleteSaysThisAmount: Double
    var donationStatus: DonationStatusEnum
    
    init(receiptImage: UIImage, supporter: String, supporterSaysThisAmount: Double, AthleteSaysThisAmount: Double, donationStatus: DonationStatusEnum){
        self.receiptImage = receiptImage
        self.supporter = supporter
        self.supporterSaysThisAmount = supporterSaysThisAmount
        self.athleteSaysThisAmount = AthleteSaysThisAmount
        self.donationStatus = donationStatus
    }
    

}
