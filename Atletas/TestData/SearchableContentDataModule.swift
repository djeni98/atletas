//
//  SearchableContentDataModule.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 13/09/21.
//
import UIKit

class SearchableContent {
    var name: String
    var description: String?
    var image: UIImage?
    var scope: SearchScopeButton
    weak var reference: AnyObject?

    init(name: String, scope: SearchScopeButton, description: String?, image: UIImage?, reference: AnyObject?) {
        self.name = name
        self.description = description
        self.scope = scope
        self.reference = reference
    }

    func match(_ searchText: String) -> Bool {
        let text = searchText.lowercased()

        let matchName = name.lowercased().contains(text)
        let matchDesc = description?.lowercased().contains(text) ?? false

        return matchName || matchDesc
    }
}

class SearchableContentDataModule {
    var athletes = AthleteDataModule.shared.athletes
    var projects = ProjectDataModule.shared.projects.filter { $0.isMonthlyProject == false }
    var sports = SportsDataModule.shared.sports
    
    static var shared: SearchableContentDataModule = {
        let instance = SearchableContentDataModule()
        return instance
    }()

    private init() {}

    func getContent() -> [SearchableContent] {
        var list = [SearchableContent]()

        list += athletes.map { athlete in
            return SearchableContent(
                name: athlete.name, scope: .athlete,
                description: athlete.getDescription(), image: athlete.image, reference: athlete)
        }

        list += projects.map { project in
            return SearchableContent(
                name: project.title, scope: .project,
                description: project.getDescription(), image: project.image, reference: project)
        }

        list += sports.map { sport in
            return SearchableContent(
                name: sport.sport.getName(), scope: .sport,
                description: nil, image: sport.sportImage, reference: sport)
        }

        return list
    }

    func getContentFiltered(by sport: SportEnum) -> [SearchableContent] {
        var list = [SearchableContent]()

        list += athletes.filter { $0.sport == sport } .map { athlete in
            return SearchableContent(
                name: athlete.name, scope: .athlete,
                description: athlete.getDescription(), image: athlete.image, reference: athlete)
        }

        list += projects.filter { $0.sport == sport } .map { project in
            return SearchableContent(
                name: project.title, scope: .project,
                description: project.getDescription(), image: project.image, reference: project)
        }

        return list
    }
}
