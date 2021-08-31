//
//  SearchViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 31/08/21.
//

import UIKit

// SearchBar references:
// https://github.com/codepath/ios_guides/wiki/Search-Bar-Guide

class SearchViewController: UIViewController, UISearchResultsUpdating {
    var tableView: UITableView!
    var tableViewAdapter = AthleteListTableViewAdapter()

    var searchController: UISearchController!

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
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar

        definesPresentationContext = true
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            // filter data
            print(searchText)
            // tableView.reloadData()
        }
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
