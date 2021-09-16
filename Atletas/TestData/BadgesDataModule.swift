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
        Badge(title: "Primeira Doação", image: UIImage(named:"badge-primeiradoacao"), shortDescription: "Primeira doação", detailedDescription: "Você recebeu esse badge por ter apoiado o esporte pela primeira vez.", objectName: "badge-primeiradoacao")
        
    }
    
    private func getBronze() -> Badge {
        Badge(title: "Bronze", image: UIImage(named:"badge-bronze"), shortDescription: "100 reais", detailedDescription: "Você recebeu esse badge por ter doado 100 reais para apoiar o esporte", objectName: "badge-bronze")
        
    }
    
    private func getSilver() -> Badge {
        Badge(title: "Prata", image: UIImage(named:"badge-prata"), shortDescription: "500 reais", detailedDescription: "Você recebeu esse badge por ter doado 500 reais para apoiar o esporte", objectName: "badge-prata")
        
    }
    
    private func getGold() -> Badge {
        Badge(title: "Ouro", image: UIImage(named:"badge-ouro"), shortDescription: "1000 reais", detailedDescription: "Você recebeu esse badge por ter doado 1000 reais para apoiar o esporte", objectName: "badge-ouro")
        
    }
    
    private func getOlympic() -> Badge {
        Badge(title: "Olímpico", image: UIImage(named:"badge-olimpico"), shortDescription: "Atleta Olímpico", detailedDescription: "Você recebeu esse badge por ter doado para um atleta olímpico", objectName: "badge-olimpico")
        
    }
    
    private func getTenDonations() -> Badge {
        Badge(title: "10 doações", image: UIImage(named:"badge-10projetos"), shortDescription: "10 doações", detailedDescription: "Você recebeu esse badge por ter apoiado 10 projetos", objectName: "badge-10projetos")
        
    }
    
    private func getTwentyDonations() -> Badge {
        Badge(title: "20 doações", image: UIImage(named:"badge-20projetos"), shortDescription: "20 doações", detailedDescription: "Você recebeu esse badge por ter apoiado 20 projetos", objectName: "badge-20projetos")
    }
}
