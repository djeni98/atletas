//
//  Donation.swift
//  Donation
//
//  Created by Guilerme Barciki on 26/08/21.
//

import Foundation
import UIKit

class Donation {
    
    let receiptImage: UIImage
    let supporter: String
    let supporterSaysThisAmount: Double
    let athleteSaysThisAmount: Double
    let donationStatus: DonationStatusEnum
    
    init(receiptImage: UIImage, supporter: String, supporterSaysThisAmount: Double, AthleteSaysThisAmount: Double, donationStatus: DonationStatusEnum){
        self.receiptImage = receiptImage
        self.supporter = supporter
        self.supporterSaysThisAmount = supporterSaysThisAmount
        self.athleteSaysThisAmount = AthleteSaysThisAmount
        self.donationStatus = donationStatus
    }
    

}
