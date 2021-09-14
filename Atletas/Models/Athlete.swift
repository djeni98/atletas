//
//  Athlete.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import Foundation
import UIKit

class Athlete: User {
    var name: String
    var sport: SportEnum
    var category: SportCategoryEnum
    var pixInfo: PixInformation

    var image: UIImage?
    var about: String
    var city: String

    var contact: Contact
    var socialMedia: SocialMedia

    var projects: [Project] = []

    init(
        name: String, username: String, password: String,
        sport: SportEnum, category: SportCategoryEnum,
        pixInfo: PixInformation,
        image: UIImage?, about: String = "", city: String = "",
        contact: Contact = .notSet(), socialMedia: SocialMedia = .notSet()
    ) {
        self.name = name
        self.sport = sport
        self.category = category
        self.pixInfo = pixInfo

        self.image = image
        self.about = about
        self.city = city

        self.contact = contact
        self.socialMedia = socialMedia
        super.init(username: username, password: password, type: .athlete)
    }

    func getFirstName() -> String {
        return name.components(separatedBy: " ")[0]
    }

    func getDonations() -> [Donation] {
        return projects.reduce([], { $0 + $1.donations })
    }

    func getDescription() -> String {
        return "Atleta de \(sport.getName()) - \(category.getName())"
    }

    func getPhone() -> String {
        return contact.phone.isEmpty ? "Não Informado" : contact.phone
    }

    func getEmail() -> String {
        return contact.email.isEmpty ? "Não Informado" : contact.email
    }
}
