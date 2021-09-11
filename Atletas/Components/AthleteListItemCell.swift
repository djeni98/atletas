//
//  AthleteListItemCell.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 31/08/21.
//

import UIKit
class AthleteListItemCell: UITableViewCell {
    var athleteListItem = AthleteListItem()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "background")
        selectionStyle = .none

        // Set any attributes of your UI components here.
        athleteListItem.translatesAutoresizingMaskIntoConstraints = false

        // Add the UI components
        contentView.addSubview(athleteListItem)

        let constant: CGFloat = 24
        NSLayoutConstraint.activate([
            athleteListItem.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
            athleteListItem.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -constant),

            athleteListItem.topAnchor.constraint(equalTo: contentView.topAnchor),
            athleteListItem.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(name: String, description: String) {
        athleteListItem.nameLabel.text = name
        athleteListItem.descriptionLabel.text = description
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
