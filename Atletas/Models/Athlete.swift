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
    var image: UIImage
    var about: String
    var category: SportCategoryEnum
    var contact: String
    var pixKey: String
    var city: String
    var socialMedia: SocialMedia
    var projects: [Project] = []
    var sport: SportEnum

    init(name: String, username: String, password: String, image: UIImage, about: String, category: SportCategoryEnum, contact: String, pixKey: String, city: String, socialMedia: SocialMedia, sport: SportEnum) {
        self.name = name
        self.image = image
        self.about = about
        self.category = category
        self.contact = contact
        self.pixKey = pixKey
        self.city = city
        self.socialMedia = socialMedia
        self.sport = sport
        super.init(username: username, password: password)
    }

    func getFirstName() -> String {
        return name.components(separatedBy: " ")[0]
    }

    func getDonations() -> [Donation] {
        return projects.reduce([], { $0 + $1.donations })
    }

    func getDescription() -> String {
        return "TODO: Athlete Description"
    }

    func getPhone() -> String {
        return "(99) 99999-9999"
    }

    func getEmail() -> String {
        return "athlete@email.com"
    }
}
