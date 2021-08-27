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
    var type: Type
    var contact: String
    var pixKey: String
    var city: String
    var social: Social
    var projects: [Project]
    var sport: Sport
    
    init(name: String, username: String, password: String) {
        super.init(username: username, password: password)
        self.name = name
    }
}
