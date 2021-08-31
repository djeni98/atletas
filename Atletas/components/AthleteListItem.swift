//
//  AthleteListItem.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 31/08/21.
//

import UIKit

class AthleteListItem: UIView {
    var nameString = "Name String"
    var descriptionString = "Description String"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    func oldRect() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 32
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 14
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        let circleSize: CGFloat = 40
        let circleImageView = UIImageView()
        circleImageView.backgroundColor = UIColor.gray
        circleImageView.layer.cornerRadius = circleSize / 2
        circleImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(circleImageView)

        let nameLabel = UILabel()
        nameLabel.text = nameString
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)

        let descriptionLabel = UILabel()
        descriptionLabel.text = descriptionString
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.textColor = UIColor.secondaryLabel
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionLabel)

        NSLayoutConstraint.activate([
            circleImageView.heightAnchor.constraint(equalToConstant: circleSize),
            circleImageView.widthAnchor.constraint(equalToConstant: circleSize),

            circleImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            circleImageView.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor),

            nameLabel.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: circleImageView.centerYAnchor),

            descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
        ])
    }
}

#if DEBUG
import SwiftUI
struct AthleteListItem_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView {
                let item = AthleteListItem()
                item.nameString = "Mayra Sayumi Akamine"

                return item
            }
        }.previewLayout(.fixed(width: 330, height: 80))
    }

    struct ContentView: UIViewRepresentable {
        let viewBuilder: () -> UIView

        init(_ viewBuilder: @escaping () -> UIView) {
            self.viewBuilder = viewBuilder
        }

        func makeUIView(context: Context) -> some UIView {
            viewBuilder()
        }

        func updateUIView(_ uiView: UIViewType, context: Context) {
            // Not needed
        }
    }
}
#endif
