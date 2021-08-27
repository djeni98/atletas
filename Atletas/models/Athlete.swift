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
    var type: SportCategoryEnum
    var contact: String
    var pixKey: String
    var city: String
    var social: Social
    var projects: [Project]
    var sport: Sport

    init(name: String, username: String, password: String, image: UIImage, about: String, type: SportCategoryEnum, contact: String, pixKey: String, city: String, social: Social, projects: [Project], sport: Sport) {
        self.name = name
        self.image = image
        self.about = about
        self.type = type
        self.contact = contact
        self.pixKey = pixKey
        self.city = city
        self.social = social
        self.projects = projects
        self.sport = sport
        super.init(username: username, password: password)
    }
}
