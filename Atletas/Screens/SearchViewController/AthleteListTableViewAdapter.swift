//
//  AthleteListTableViewAdapter.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 31/08/21.
//
import UIKit

struct TestingItens {
    var name: String
    var desc: String?
    var scope: SearchScopeButton

    func match(_ searchText: String) -> Bool {
        let text = searchText.lowercased()

        let matchName = name.lowercased().contains(text)
        let matchDesc = desc?.lowercased().contains(text) ?? false

        return matchName || matchDesc
    }
}

class AthleteListTableViewAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    var array = [TestingItens]()
    var filtered = [TestingItens]()
    var scope = SearchScopeButton.all

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        var itens = [TestingItens]()
        itens += Array(1...5).map { n in
            return TestingItens(name: "Name \(n)", desc: "Athlete ...", scope: .athlete)
        }

        itens += Array(5...10).map { n in
            return TestingItens(name: "Project \(n)", desc: "...", scope: .project)
        }

        itens += Array(11...15).map { n in
            return TestingItens(name: "Sport \(n)", scope: .sport)
        }
        self.array = itens
        self.filtered = itens

        self.navigationController = navigationController
    }

    func filterContent(by text: String?, withCategory: SearchScopeButton? = .all) {
        scope = withCategory ?? .all
        filtered = array.filter { item in
            let categoryMatches = scope == .all || item.scope == scope

            if let searchText = text, searchText != "" {
                return categoryMatches && item.match(searchText)
            } else {
                return categoryMatches
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = filtered[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "athleteCell", for: indexPath) as! AthleteListItemCell
        cell.configure(name: item.name, description: item.desc ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewController: UIViewController!
        let item = filtered[indexPath.row]

        switch item.scope {
        case .sport: viewController = SportScreenViewController()
        case .athlete: viewController = AthleteProfileViewController()
        case .project: viewController = ShowProjectViewController()
        default:
            fatalError("This item can not be opened.")
        }

        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
