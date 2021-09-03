//
//  SearchViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 31/08/21.
//

import UIKit

// SearchBar references:
// https://github.com/codepath/ios_guides/wiki/Search-Bar-Guide
// https://www.raywenderlich.com/4363809-uisearchcontroller-tutorial-getting-started

enum SearchScopeButton: String, CaseIterable {
    case all = "Principais"
    case sport = "Modalidades"
    case athlete = "Atletas"
    case project = "Projetos"
}

class SearchViewController: UIViewController, UISearchBarDelegate {
    var tableView: UITableView!
    var tableViewAdapter = AthleteListTableViewAdapter()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground

        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        tableView.dataSource = tableViewAdapter
        tableView.rowHeight = 80
        let inset: CGFloat = 24
        tableView.separatorInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
        tableView.register(AthleteListItemCell.self, forCellReuseIdentifier: "athleteCell")

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let searchBarController = SearchBarWithScopeButton(width: view.frame.width)
        searchBarController.setDelegate(self)
        tableView.tableHeaderView = searchBarController
        tableView.tableFooterView = UIView()
    }

    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        let selectedScope = searchBar.selectedScopeButtonIndex
        let category = SearchScopeButton.allCases[selectedScope]
        tableViewAdapter.filterContent(by: searchText, withCategory: category)
        tableView.reloadData()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }

    func searchBar(_ searchBar: UISearchBar,
                   selectedScopeButtonIndexDidChange selectedScope: Int) {
        let category = SearchScopeButton.allCases[selectedScope]
        tableViewAdapter.filterContent(by: searchBar.text, withCategory: category)
        tableView.reloadData()
    }

}

#if DEBUG
import SwiftUI
struct SearchViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            let navigationController = UINavigationController(rootViewController: SearchViewController())
            navigationController.setNavigationBarHidden(true, animated: true)

            return navigationController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif
