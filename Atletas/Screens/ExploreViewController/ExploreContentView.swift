//
//  ExploreContentView.swift
//  Atletas
//
//  Created by André Schueda on 02/09/21.
//

import UIKit

class ExploreContentView: UIView {
    var navigationController: UINavigationController?
    
    lazy var sportsView: SportsView = {
        let view = SportsView(navigationController: navigationController)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var athletesView: AthletesView = {
        let view = AthletesView(navigationController: navigationController)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var projectsView: ProjectsView = {
        let view = ProjectsView(navigationController: navigationController)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(frame: CGRect = .zero, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init(frame: .zero)
        
        setupSportsView()
        setupAthletesView()
        setupProjectsview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init")
    }
    
    func setupSportsView() {
        addSubview(sportsView)
        sportsView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupAthletesView() {
        addSubview(athletesView)
        athletesView.snp.makeConstraints { make in
            make.top.equalTo(sportsView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupProjectsview() {
        addSubview(projectsView)
        projectsView.snp.makeConstraints { make in
            make.top.equalTo(athletesView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
}
