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
    lazy var searchBar:UISearchBar = UISearchBar()
    
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
        //view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Softball"
    
        //definesPresentationContext = true
        
        let searchBarController = SearchBarWithScopeButton(width: view.frame.width)
        searchBarController.setDelegate(self)
        
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        view.addSubview(searchBar)
        navigationItem.titleView = searchBar
        
        //tableView.tableHeaderView = header
        
        //tableView.tableFooterView = UIView()

        //searchController.searchBar.scopeButtonTitles = SearchScopeButton.allCases.map { $0.rawValue }
        //searchController.searchBar.delegate = self
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
                   textDidChange searchText: String) {
        let selectedScope = searchBar.selectedScopeButtonIndex
        let category = SearchScopeButton.allCases[selectedScope]
        tableViewAdapter.filterContent(by: searchText, withCategory: category)
        tableView.reloadData()
    }
}
func setHeader(sportName: String) -> UILabel{
    var headerText = UILabel()
    headerText.text = "fspofksd"
    return headerText
    
    
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
