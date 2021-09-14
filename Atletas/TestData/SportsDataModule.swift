//
//  SportsDataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//
import UIKit

class SportsDataModule {
    var sports = [Sport]()
    static var shared: SportsDataModule {
        let instance = SportsDataModule()

        return instance
    }

    private init() {
        sports += SportEnum.allCases.map(getSport)
    }

    func getSport(withEnum sportEnum: SportEnum) -> Sport {
        let image = sportEnum.getImage() ?? UIImage(named: "???")!
        let header = sportEnum.getHeaderImage() ?? UIImage(named: "???")!
        return Sport(sport: sportEnum, sportImage: image, headerImage: header)
    }
}
