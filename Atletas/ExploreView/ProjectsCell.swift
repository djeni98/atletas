//
//  ProjectsCell.swift
//  Atletas
//
//  Created by André Schueda on 02/09/21.
//

import UIKit

class ProjectsCell: UICollectionViewCell {
    static let identifier = UUID().uuidString
   
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
    
    required init?(coder: NSCoder) {
        fatalError("init hasn't been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupProjects()
    }
    
    func setupProjects() {
        addSubview(projectsContainer)
        projectsContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        projectsContainer.addSubview(projectsLabel)
        projectsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
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
}
