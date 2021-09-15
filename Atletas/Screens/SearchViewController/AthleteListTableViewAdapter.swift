//
//  AthleteListTableViewAdapter.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 31/08/21.
//
import UIKit

class AthleteListTableViewAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
    var array = [SearchableContent]()
    var filtered = [SearchableContent]()
    var scope = SearchScopeButton.all

    var navigationController: UINavigationController?

    init(itens: [SearchableContent], navigationController: UINavigationController?) {
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
        cell.configure(name: item.name, description: item.description ?? "", image: item.image)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = filtered[indexPath.row]

        switch item.scope {
        case .sport:
            let viewController = SportScreenViewController()
            viewController.sport = (item.reference as! Sport).sport
            self.navigationController?.pushViewController(viewController, animated: true)
        case .athlete:
            let viewController = AthleteProfileViewController()
            viewController.athlete = (item.reference as! Athlete)
            self.navigationController?.pushViewController(viewController, animated: true)
        case .project:
            let projectVC = ShowProjectViewController()
            projectVC.project = (item.reference as! Project)
            
            let viewController = UINavigationController(rootViewController: projectVC)
            viewController.modalPresentationStyle = .fullScreen
            self.navigationController?.present(viewController, animated: true, completion: nil)
        default:
            fatalError("This item can not be opened.")
        }

    }
}
