//
//  File.swift
//  Atletas
//
//  Created by Guilerme Barciki on 01/09/21.
//


import UIKit

class SportScreenViewController: UIViewController, UISearchBarDelegate {
    var tableView: UITableView!
    var tableViewAdapter: AthleteListTableViewAdapter!
    var sportName: String!
    var searchController: UISearchController!
    lazy var searchBar = SearchBar(width: view.frame.width)
    var sport: SportEnum!
    
    override func loadView() {
        super.loadView()
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        let searchableContent = SearchableContentDataModule.shared.getContentFiltered(by: sport)
        tableViewAdapter = AthleteListTableViewAdapter(itens: searchableContent, navigationController: navigationController)
        tableView.delegate = tableViewAdapter
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

        view.backgroundColor = UIColor(named: "background")
        tableView.backgroundColor = UIColor(named: "background")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.backgroundColor = .white
        
        guard let naviBar = navigationController?.navigationBar else { return }
        naviBar.prefersLargeTitles = true
        navigationItem.title = sport.getName()
        naviBar.sizeToFit()
        tableView.tableHeaderView = searchBar
        tableView.tableFooterView = UIView()
        searchBar.setDelegate(self)
    }


    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        tableViewAdapter.filterContent(by: searchText)
        tableView.reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.text = ""
        searchBar.resignFirstResponder()
        tableViewAdapter.filterContent(by: "")
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
