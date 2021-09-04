//
//  File.swift
//  Atletas
//
//  Created by Guilerme Barciki on 01/09/21.
//

import Foundation
import UIKit

//enum SearchScopeButton: String, CaseIterable {
//    case all = "Principais"
//    case sport = "Modalidades"
//    case athlete = "Atletas"
//    case project = "Projetos"
//}

class SportScreenViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    var tableView: UITableView!
    var tableViewAdapter = AthleteListTableViewAdapter()
    var sportName: String!
    var searchController: UISearchController!
    
    override func loadView() {
        
        //let segmentBarItem = UIBarButtonItem(customView: )
        super.loadView()
        //view.backgroundColor = .systemBackground
    
        
        
       
        
        
        
        
        
        
        
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
        sportName = "Frescobol"
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.barStyle = .default
        navigationController!.navigationBar.isTranslucent = true
        navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController!.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        tableView.tableHeaderView = searchController.searchBar

        definesPresentationContext = true

        //searchController.searchBar.scopeButtonTitles = SearchScopeButton.allCases.map { $0.rawValue }
        searchController.searchBar.delegate = self
    }

    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        //let category = SearchScopeButton(
            //rawValue: searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        //)

        //tableViewAdapter.filterContent(by: searchBar.text, withCategory: category)
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar,
                   selectedScopeButtonIndexDidChange selectedScope: Int) {
        let category = SearchScopeButton(
            rawValue: searchBar.scopeButtonTitles![selectedScope]
        )
        tableViewAdapter.filterContent(by: searchBar.text, withCategory: category)
        tableView.reloadData()
    }
}

#if DEBUG
import SwiftUI
struct SportScreenViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            let navigationController = UINavigationController(rootViewController: SportScreenViewController())
            //navigationController.setNavigationBarHidden(true, animated: true)
        

            return navigationController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif
