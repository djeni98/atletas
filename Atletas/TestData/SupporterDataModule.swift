//
//  SupporterDataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//
import UIKit

class SupporterDataModule {
    var supporters = [Supporter]()
    static var shared: SupporterDataModule = {
        let instance = SupporterDataModule()

        return instance
    }()

    private init() {
        supporters += [
            Supporter(name: "Leonardo Vieira", username: "leovieira", password: "********"),
            Supporter(name: "Eliane Martins", username: "elianemartins", password: "********"),
            Supporter(name: "Márcio Lima", username: "marciolima", password: "********")
        ]
    }
}
