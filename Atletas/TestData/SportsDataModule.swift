//
//  SportsDataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//
import UIKit

class SportsDataModule {
    func getAllSports() -> [Sport] {
        return SportEnum.allCases.map(getSport)
    }

    func getSport(withEnum sportEnum: SportEnum) -> Sport {
        let image = sportEnum.getImage() ?? UIImage(named: "???")!
        let header = sportEnum.getHeaderImage() ?? UIImage(named: "???")!
        return Sport(sport: sportEnum, sportImage: image, headerImage: header)
    }
}
