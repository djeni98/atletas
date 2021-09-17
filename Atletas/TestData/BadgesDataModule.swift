//
//  BadgesDataModule.swift
//  Atletas
//
//  Created by André Schueda on 16/09/21.
//

import UIKit

class BadgesDataModule {
    var badges: [Badge] = []
    static var shared: BadgesDataModule {
        let instance = BadgesDataModule()

        return instance
    }
    
    private init() {
        badges = [getFirstDonation(), getBronze(), getSilver(),
                  getGold(), getOlympic(), getTenDonations(),
                  getTwentyDonations()]
    }
    
    private func getFirstDonation() -> Badge {
        Badge(title: "Primeira Doação", imageName: "badge-primeiradoacao", shortDescription: "Primeira doação", detailedDescription: "Você recebeu esse badge por ter apoiado o esporte pela primeira vez.", objectName: "badge-primeiradoacao", toAchieveDescription: "Receba esse badge ao apoiar o esporte pela primeira vez")
        
    }
    
    private func getBronze() -> Badge {
        Badge(title: "Bronze", imageName: "badge-bronze", shortDescription: "100 reais", detailedDescription: "Você recebeu esse badge por ter doado 100 reais para apoiar o esporte", objectName: "badge-bronze", toAchieveDescription: "Receba esse badge ao doar 100 reais para apoiar o esporte")
        
    }
    
    private func getSilver() -> Badge {
        Badge(title: "Prata", imageName: "badge-prata", shortDescription: "500 reais", detailedDescription: "Você recebeu esse badge por ter doado 500 reais para apoiar o esporte", objectName: "badge-prata", toAchieveDescription: "Receba esse badge ao doar 500 reais para apoiar o esporte")
        
    }
    
    private func getGold() -> Badge {
        Badge(title: "Ouro", imageName: "badge-ouro", shortDescription: "1000 reais", detailedDescription: "Você recebeu esse badge por ter doado 1000 reais para apoiar o esporte", objectName: "badge-ouro", toAchieveDescription: "Receba esse badge ao doar 1000 reais para apoiar o esporte")
        
    }
    
    private func getOlympic() -> Badge {
        Badge(title: "Olímpico", imageName: "badge-olimpico", shortDescription: "Atleta Olímpico", detailedDescription: "Você recebeu esse badge por ter doado para um atleta olímpico", objectName: "badge-olimpico", toAchieveDescription: "Receba esse badge ao doar para um atleta olímpico")
        
    }
    
    private func getTenDonations() -> Badge {
        Badge(title: "10 doações", imageName: "badge-10projetos", shortDescription: "10 doações", detailedDescription: "Você recebeu esse badge por ter apoiado 10 projetos", objectName: "badge-10projetos", toAchieveDescription: "Receba esse badge ao ter apoiado 10 projetos")
        
    }
    
    private func getTwentyDonations() -> Badge {
        Badge(title: "20 doações", imageName: "badge-20projetos", shortDescription: "20 doações", detailedDescription: "Você recebeu esse badge por ter apoiado 20 projetos", objectName: "badge-20projetos", toAchieveDescription: "Receba esse badge ao ter apoiado 20 projetos")
    }
}
