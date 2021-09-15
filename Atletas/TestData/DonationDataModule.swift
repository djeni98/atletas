//
//  DonationDataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 14/09/21.
//
import UIKit

class DonationDataModule {
    var donations = [Donation]()
    var athleteModule = AthleteDataModule.shared
    var projectModule = ProjectDataModule.shared
    var supporterModule = SupporterDataModule.shared

    static var shared: DonationDataModule = {
        let instance = DonationDataModule()

        return instance
    }()

    private init() {
        projectModule.projects.forEach { self.createDonation(for: $0) }
    }

    private func createDonation(for project: Project) {
        let donationsNumber = Int.random(in: 1...25)
        let image = UIImage(named: "???")
        for _ in 0..<donationsNumber {
            let supporter = supporterModule.supporters.randomElement()!
            let supporterAmount = Double.random(in: 20...200)

            let status = DonationStatusEnum.allCases.randomElement()!
            let athleteAmount = status == .confirmed ? supporterAmount : 0

            let donation = Donation(receiptImage: image, supporter: supporter, supporterAmount: supporterAmount, athleteAmount: athleteAmount, status: status, project: project)
            
            let donationDate = Date.randomBetween(start: Date.parse("2018-01-01"), end: Date.parse("2021-09-20"))
            donation.date = donationDate

            supporter.donations.append(donation)
            project.donations.append(donation)
            donations.append(donation)
        }
    }
}
