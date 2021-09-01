//
//  ViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 26/08/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Procurar"
        return searchBar
    }()

    lazy var scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    lazy var scrollContent: UIView = {
        let scroll = UIView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var sportsContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    lazy var sportsLabel: UILabel = {
        let label = UILabel()
        label.text = "Modalidades"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var sportsRow: SupportableRowView = {
        let row = SupportableRowView()
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()
    
    lazy var athletesContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    lazy var athletesLabel: UILabel = {
        let label = UILabel()
        label.text = "Novos atletas"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var athletesRow: SupportableRowView = {
        let row = SupportableRowView()
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()
    
    lazy var projectsContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    lazy var projectsLabel: UILabel = {
        let label = UILabel()
        label.text = "Quase lá!"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var projectsRow: SupportableRowView = {
        let row = SupportableRowView()
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()

    
    override func loadView() {
        super.loadView()
        
        setupSearchBar()
//        setupScroll()
        setupSports()
        setupAthletes()
        setupProjects()
    }
    
    func setupSearchBar() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
    
    func setupScroll() {
        view.addSubview(scroll)
        scroll.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalToSuperview()
        }
        scroll.addSubview(scrollContent)
        scrollContent.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    func setupSports() {
        view.addSubview(sportsContainer)
        sportsContainer.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        sportsContainer.addSubview(sportsLabel)
        sportsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        sportsContainer.addSubview(sportsRow)
        sportsRow.snp.makeConstraints { make in
            make.top.equalTo(sportsLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(130)
        }
    }
    
    func setupAthletes() {
        view.addSubview(athletesContainer)
        athletesContainer.snp.makeConstraints { make in
            make.top.equalTo(sportsContainer.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        athletesContainer.addSubview(athletesLabel)
        athletesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        athletesContainer.addSubview(athletesRow)
        athletesRow.snp.makeConstraints { make in
            make.top.equalTo(athletesLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(130)
        }
    }
    
    func setupProjects() {
        view.addSubview(projectsContainer)
        projectsContainer.snp.makeConstraints { make in
            make.top.equalTo(athletesContainer.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        projectsContainer.addSubview(projectsLabel)
        projectsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        projectsContainer.addSubview(projectsRow)
        projectsRow.snp.makeConstraints { make in
            make.top.equalTo(projectsLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(130)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Ajude um atleta"
        
    }
    
    
}

//#if DEBUG
//import SwiftUI
//struct ViewController_Preview: PreviewProvider {
//    static var previews: some View {
//        ContentView().previewDevice("iPhone 12")
//    }
//
//    struct ContentView: UIViewControllerRepresentable {
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            return ViewController()
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//    }
//}
//#endif
