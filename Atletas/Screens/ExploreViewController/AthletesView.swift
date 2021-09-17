//
//  AthletesCell.swift
//  Atletas
//
//  Created by André Schueda on 02/09/21.
//

import UIKit

class AthletesView: UICollectionViewCell {
    var navigationController: UINavigationController?
    
    static let identifier = UUID().uuidString
    
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
        let supportables = AthleteDataModule.shared.athletes.slice(0..<10).shuffled()
    
        let row = SupportableRowView(supportables: supportables, navigationController: navigationController)
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()

    required init?(coder: NSCoder) {
        fatalError("init hasn't been implemented")
    }
    
    init(frame: CGRect = .zero, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        super.init(frame: .zero)
        
        setupAthletes()
    }

    func setupAthletes() {
        addSubview(athletesContainer)
        athletesContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        athletesContainer.addSubview(athletesLabel)
        athletesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
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
}
