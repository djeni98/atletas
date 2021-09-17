//
//  ProjectDataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//
import UIKit

class ProjectDataModule {
    var projects = [Project]()
    var athletesModule = AthleteDataModule.shared
    static var shared: ProjectDataModule = {
        let instance = ProjectDataModule()

        return instance
    }()

    private init() {
        createRendaAtletaForAll()
        createProjectsForSoftball()
        createProjectsForVolleyBall()
    }

    private func createRendaAtletaForAll() {
        let athletes = athletesModule.athletes

        athletes.forEach { athlete in
            let imageName = "renda_atleta_\(athlete.sport.getSimpleName())"
            let image = UIImage(named: imageName)
            let project = MonthlyProject(
                goal: Double.random(in: 1500...3000), image: image, sport: athlete.sport, category: athlete.category
            )
            project.athlete = athlete

            athlete.projects.append(project)
            projects.append(project)
        }
    }

    private func createProjectsForSoftball() {
        let projects = [createSulAmericanoProject, createEquipmentProject, createCampeonatoBrasileiroProject]
        let athletes = athletesModule.athletes.filter({ $0.sport == .softball })

        athletes.enumerated().forEach({ index, athlete in
            let createProject = projects[index % projects.count]
            createProject(athlete)
        })
    }

    private func createProjectsForVolleyBall() {
        let projects = [createCampeonatoEstadualProject, createParis2024Project]
        let athletes = athletesModule.athletes.filter({ $0.sport == .voleiball })

        athletes.enumerated().forEach({ index, athlete in
            let createProject = projects[index % projects.count]
            createProject(athlete)
        })
    }

    private func createSulAmericanoProject(for athlete: Athlete) {
        let image = UIImage(named: "sul_americano_capa")
        let project = Project(
            title: "Sul Americano 2022", goal: 4000, deadline: "01/01/2022", image: image,
            sport: athlete.sport, category: athlete.category)
        project.about = "Essa competição é a classificatória para o Sul-Americano. Vai ser no Peru e preciso custear as despesas da viagem"
        project.athlete = athlete

        athlete.projects.append(project)
        projects.append(project)
    }

    private func createEquipmentProject(for athlete: Athlete) {
        let image = UIImage(named: "equipamentos")
        let project = Project(
            title: "Equipamentos", goal: 750, deadline: "15/10/2021", image: image,
            sport: athlete.sport, category: athlete.category)
        project.about = "Preciso repor equipamento para treino. Estão inclusos luvas, taco e bolas."
        project.athlete = athlete

        athlete.projects.append(project)
        projects.append(project)
    }

    private func createCampeonatoBrasileiroProject(for athlete: Athlete) {
        let image = UIImage(named: "camp_brasileiro_capa")
        let project = Project(
            title: "Taça Brasil", goal: 1350, deadline: "01/12/2021", image: image,
            sport: athlete.sport, category: athlete.category)
        project.about = "Fui convocada para a seleção para jogar nesse campeonato, mas preciso custear a viagem e a alimentação. A hospedagem eu consegui com um conhecido da cidade."
        project.athlete = athlete

        athlete.projects.append(project)
        projects.append(project)
    }

    private func createCampeonatoEstadualProject(for athlete: Athlete) {
        let image = UIImage(named: "camp_estadual_card")
        let project = Project(
            title: "Campeonato Estadual", goal: 1350, deadline: "01/12/2021", image: image,
            sport: athlete.sport, category: athlete.category)
        project.about = "Fui convocada para a seleção para jogar nesse campeonato, mas preciso custear a viagem e a alimentação. A hospedagem eu consegui com um conhecido da cidade."
        project.athlete = athlete

        athlete.projects.append(project)
        projects.append(project)
    }

    private func createParis2024Project(for athlete: Athlete) {
        let image = UIImage(named: "paris_2024_card")
        let project = Project(
            title: "Paris 2024 (renda 2022)", goal: 12000, deadline: "01/01/2022", image: image,
            sport: athlete.sport, category: athlete.category)
        project.about = "Quero reservar um dinheiro para garantir meu foco de treino para esse ciclo olímpico."
        project.athlete = athlete

        athlete.projects.append(project)
        projects.append(project)
    }
}

