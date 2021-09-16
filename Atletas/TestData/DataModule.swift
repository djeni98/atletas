//
//  DataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 14/09/21.
//

class DataModule {
    var athletes = AthleteDataModule.shared.athletes
    var projects = ProjectDataModule.shared.projects
    var donations = DonationDataModule.shared.donations
    var supporters = SupporterDataModule.shared.supporters

    static var shared = DataModule()

    private init() {}
}
