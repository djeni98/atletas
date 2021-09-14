//
//  ShowDonationStatusView.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationStatusView: UIView {
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Status:"
        label.textColor = UIColor(named: "ShowDonationFont")
        return label
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        imageView.tintColor = UIColor(named: "exclamation")
        return imageView
    }()
    
    lazy var statusLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = UIColor(named: "exclamation")
        label.text = "Negada pelo atleta"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupDescriptionLabel()
        setupIconImageView()
        setupStatusLabel()
    }
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
        }
    }
    
    func setupIconImageView() {
        addSubview(iconImageView)
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerY.equalTo(descriptionLabel)
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
    }
    
    func setupStatusLabel() {
        addSubview(statusLabel)
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(8)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
