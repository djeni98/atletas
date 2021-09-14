//
//  SportsCell.swift
//  Atletas
//
//  Created by André Schueda on 02/09/21.
//

import UIKit

class SportsCell: UICollectionViewCell {
    static let identifier = UUID().uuidString
    
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
        let supportables = SportsDataModule.shared.sports
        let row = SupportableRowView(supportables: supportables)
        row.translatesAutoresizingMaskIntoConstraints = false
        return row
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init hasn't been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupSports()
    }
    
    func setupSports() {
        addSubview(sportsContainer)
        sportsContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        sportsContainer.addSubview(sportsLabel)
        sportsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
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
}
