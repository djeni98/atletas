//
//  User.swift
//  Atletas
//
//  Created by André Schueda on 26/08/21.
//

import Foundation

class User {
    var username: String
    var password: String
    var type: UserType
    
    init(username: String, password: String, type: UserType) {
        self.username = username
        self.password = password
        self.type = type
    }
}
