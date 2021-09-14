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
        createSulAmericanoProjectForSoftball()
        if let athlete = athletesModule.athletes.filter({ $0.sport == .softball }).first {
            createEquipmentProject(for: athlete)
        }
    }

    private func createRendaAtletaForAll() {
        let athletes = athletesModule.athletes

        athletes.forEach { athlete in
            let image = UIImage(named: "???")
            let project = MonthlyProject(
                goal: Double.random(in: 1500...3000), image: image, sport: athlete.sport, category: athlete.category
            )
            project.athlete = athlete

            athlete.projects.append(project)
            projects.append(project)
        }

    }

    private func createSulAmericanoProjectForSoftball() {
        let athletes = athletesModule.athletes.filter { $0.sport == .softball }

        athletes.forEach { athlete in
            let image = UIImage(named: "???")
            let project = Project(
                title: "Sul Americano 2022", goal: 5000, deadline: "01/01/2022", image: image,
                sport: athlete.sport, category: athlete.category)
            project.about = "Essa competição é a classificatória para o Pan-Americano. Vai ser no Peru e preciso custear as despesas da viagem"
            project.athlete = athlete

            athlete.projects.append(project)
            projects.append(project)
        }
    }

    private func createEquipmentProject(for athlete: Athlete) {
        let image = UIImage(named: "???")
        let project = Project(
            title: "Equipamentos", goal: 1350, deadline: "15/11/2022", image: image,
            sport: athlete.sport, category: athlete.category)
        project.about = "Preciso repor equipamento para treino. Estão inclusos uniforme e bola."
        project.athlete = athlete

        athlete.projects.append(project)
        projects.append(project)
    }
}

