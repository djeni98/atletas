//
//  ProjectsView.swift
//  Atletas
//
//  Created by André Schueda on 02/09/21.
//

import UIKit

class ProjectsView: UIView {
    var navigationController: UINavigationController?
    
    lazy var projectsLabel: UILabel = {
        let label = UILabel()
        label.text = "Quase lá!"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var projectsRow: SupportableRowView = {
        let supportables = ProjectDataModule.shared.projects.slice(0..<10)
        let row = SupportableRowView(supportables: supportables, navigationController: navigationController)
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()
    
    init(frame: CGRect = .zero, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init(frame: .zero)
        
        setupProjectsLabel()
        setupProjectsRow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupProjectsLabel() {
        addSubview(projectsLabel)
        projectsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setupProjectsRow() {
        addSubview(projectsRow)
        projectsRow.snp.makeConstraints { make in
            make.top.equalTo(projectsLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(130)
        }
    }
}
