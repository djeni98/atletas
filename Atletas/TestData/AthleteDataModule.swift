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
        athletes += [getCarolinaSilva(), getAnaMariaMoraes()]
        athletes += [getFabricioCarvalho()]
    }
    
    private func getMayraSayumi() -> Athlete {
        let athlete = Athlete(
            name: "Mayra Sayumi", username: "mayrasayumi", password: "********",
            sport: .softball, category: .brazilianTeam,
            pixInfo: PixInformation(key: "123.456.789-00", cpf: "123.456.789-00", bank: "Banco do Brasil"),
            image: UIImage(named: "mayra_foto_perfil")
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
            image: UIImage(named: "beatrice_atleta_card")
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
            image: UIImage(named: "atleta_mulher_softbol")
        )
        athlete.about = "Atualmente moro nos Estados Unidos, mas jogo pela Seleção Brasileira de Softbol."
        athlete.city = "Thomasville"

        athlete.contact = Contact(email: "bbw@gmail.com", phone: "")
        athlete.socialMedia = SocialMedia(instagram: "@barbarawoll", facebook: "Barbara Woll", twitter: "@barbarawoll")

        return athlete
    }

    private func getCarolinaSilva() -> Athlete {
        let athlete = Athlete(
            name: "Carolina Silva", username: "carolinasilva", password: "********",
            sport: .voleiball, category: .base,
            pixInfo: PixInformation(key: "carolsilva@email.com", cpf: "111.222.333-00", bank: "NuBank"),
            image: UIImage(named: "atleta_mulher_volei")
        )
        athlete.about = "Oi, meu nome é Carolina, mas prefiro que me chamem de Carol. Tenho 17 anos e jogo pelo sub-18 de vôlei."
        athlete.city = "Belo Horizonte"

        athlete.contact = Contact(email: "carolsilva@email.com", phone: "(31) 99887-7998")
        athlete.socialMedia = SocialMedia(instagram: "@carolsilva", facebook: "Carolina Silva", twitter: "@carolzinha")

        return athlete
    }

    private func getAnaMariaMoraes() -> Athlete {
        let athlete = Athlete(
            name: "Ana Maria Moraes", username: "anamoraes", password: "********",
            sport: .voleiball, category: .brazilianTeam,
            pixInfo: PixInformation(key: "(11) 99663-3222", cpf: "333.444.555-00", bank: "Bradesco"),
            image: UIImage(named: "ana_atleta_card")
        )
        athlete.about = "Oi, me chamo Ana e tenho 23 anos. Jogo vôlei desde a escola e já joguei pela seleção no sub-21. Atualmente estou cursando Nutrição e jogo no SESI."
        athlete.city = "Osasco"

        athlete.contact = Contact(email: "anamoraes@email.com", phone: "(11) 99663-3222")
        athlete.socialMedia = SocialMedia(instagram: "@anamoraes", facebook: "Ana Maria Moraes", twitter: "@anamoraes")

        return athlete
    }

    private func getFabricioCarvalho() -> Athlete {
        let athlete = Athlete(
            name: "Fabricio Carvalho", username: "fabriciocarvalho", password: "********",
            sport: .handeball, category: .amateur,
            pixInfo: PixInformation(key: "fabricio@gmail.com", cpf: "999.777.888-00", bank: "Caixa Econômica"),
            image: UIImage(named: "atleta_homem_handebol")
        )
        athlete.about = "Olá a todos, me chamo Fabrício e comecei a jogar handebol por convite de um amigo. Ainda me considero amador nesse esporte, mas espero poder jogar profissionalmente conforme melhorar meu desempenho."
        athlete.city = "Londrina"

        athlete.contact = Contact(email: "fabricio@gmail.com", phone: "(43) 97979-7777")
        athlete.socialMedia = SocialMedia(instagram: "", facebook: "Fabricio Carvalho", twitter: "")

        return athlete
    }
}
