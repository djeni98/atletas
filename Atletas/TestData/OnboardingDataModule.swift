//
//  OnboardingDataModule.swift
//  Atletas
//
//  Created by Giovana Garcia on 22/09/21.
//

import UIKit

class OnboardingDataModule {
    var cards: [OnboardingCard] = []
    static var shared: OnboardingDataModule {
        let instance = OnboardingDataModule()

        return instance
    }
    
    private init() {
        cards = [getFirstCard(), getSecondCard(), getThirdCard()]
    }
    
    func getFirstCard() -> OnboardingCard {
        let image = UIImage(named: "card1")
        let titleText = "Apoiar o esporte brasileiro nunca foi tão fácil"
        let subtitleText = "Demonstre seu apoio a atletas brasileiros das mais diversas modalidades fazendo doações"
        return OnboardingCard(image: image, titleText: titleText, subtitleText: subtitleText)
    }
    
    func getSecondCard() -> OnboardingCard {
        let image = UIImage(named: "card2")
        let titleText = "Faça parte da trajetória de seus atletas preferidos"
        let subtitleText = "Seja mais do que um espectador do esporte, participando ativamente das vitórias dos atletas que apoia"
        return OnboardingCard(image: image, titleText: titleText, subtitleText: subtitleText)
    }
    
    func getThirdCard() -> OnboardingCard {
        let image = UIImage(named: "card3")
        let titleText = "Contribua e desbloqueie suas conquistas"
        let subtitleText = "Ao doar para algum atleta ou projeto, receba badges especiais como recompensa por seu suporte"
        return OnboardingCard(image: image, titleText: titleText, subtitleText: subtitleText)
    }
}
