//
//  AthleteDataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//
import UIKit

class AthleteDataModule {
    var athletes = [Athlete]()
    static var shared: AthleteDataModule = {
        let instance = AthleteDataModule()

        return instance
    }()

    private init() {
        athletes += [getMayraSayumi(), getBeatriceHitomi(), getBarbaraWoll()]
    }
    
    private func getMayraSayumi() -> Athlete {
        let athlete = Athlete(
            name: "Mayra Sayumi", username: "mayrasayumi", password: "********",
            sport: .softball, category: .brazilianTeam,
            pixInfo: PixInformation(key: "123.456.789-00", cpf: "123.456.789-00", bank: "Banco do Brasil"),
            image: UIImage(named: "???")
        )
        athlete.about = "Oiee! Meu nome é Mayra Sayumi Akamine, tenho 27 anos, moro em Maringá, mas jogo pelo Nikkey Marília desde 2015. Sou formada em engenharia de alimentos, mas não exerço e atualmente curso educação física."
        athlete.city = "Curitiba"

        athlete.contact = Contact(email: "mayra@gmail.com", phone: "(41) 99999-8888")
        athlete.socialMedia = SocialMedia(instagram: "@mayrasayumi", facebook: "Mayra Sayumi", twitter: "@mayrasayumi")

        return athlete
    }

    private func getBeatriceHitomi() -> Athlete {
        let athlete = Athlete(
            name: "Beatrice Hitomi Nakae", username: "hitominakae", password: "********",
            sport: .softball, category: .brazilianTeam,
            pixInfo: PixInformation(key: "hitomi@gmail.com", cpf: "456.789.123-00", bank: "Santander"),
            image: UIImage(named: "???")
        )
        athlete.about = "Oi gente, me chamo Beatrice, tenho 23 anos e sou de Curitiba. Jogo softbol desde os 6 anos e atualmene estou na seleção brasileira."
        athlete.city = "Curitiba"

        athlete.contact = Contact(email: "hitomi@gmail.com", phone: "(41) 98989-8888")
        athlete.socialMedia = SocialMedia(instagram: "@hitominakae", facebook: "Hitomi Nakae", twitter: "@hitominakae")

        return athlete
    }

    private func getBarbaraWoll() -> Athlete {
        let athlete = Athlete(
            name: "Barbara Woll", username: "barbarawoll", password: "********",
            sport: .softball, category: .brazilianTeam,
            pixInfo: PixInformation(key: "abcd-1234-abcd-1234-abcde", cpf: "789.123.456-00", bank: "Itaú"),
            image: UIImage(named: "???")
        )
        athlete.about = "Atualmente moro nos Estados Unidos, mas jogo pela Seleção Brasileira de Softbol."
        athlete.city = "Thomasville"

        athlete.contact = Contact(email: "bbw@gmail.com", phone: "")
        athlete.socialMedia = SocialMedia(instagram: "@barbarawoll", facebook: "Barbara Woll", twitter: "@barbarawoll")

        return athlete
    }
}
