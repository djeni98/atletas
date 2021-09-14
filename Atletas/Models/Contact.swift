//
//  Contact.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//

struct Contact {
    var email: String
    var phone: String

    static func notSet() -> Contact {
        return Contact(email: "", phone: "")
    }
}
