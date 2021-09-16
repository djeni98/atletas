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
            getSupporter(name: "Leonardo Vieira", username: "leovieira", imageName: "apoiador_homem_1"),
            getSupporter(name: "Eliane Martins", username: "elainemartins", imageName: "apoiadora_mulher_1"),
            getSupporter(name: "Márcio Lima", username: "marciolima", imageName: "apoiador_homem_2"),
        ]
    }

    private func getSupporter(name: String, username: String, imageName: String) -> Supporter {
        let image = UIImage(named: imageName)
        return Supporter(name: name, username: username, password: "********", image: image)
    }
}
