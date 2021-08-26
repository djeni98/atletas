//
//  Supporter.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import Foundation

class Supporter: User {
    var name: String
    var badges: [Badge]
    var donations: [Donation]
    var level: Level
    
    init(name: String, username: String, password: String) {
        super.init(username: username, password: password)
        self.name = name
    }
}
