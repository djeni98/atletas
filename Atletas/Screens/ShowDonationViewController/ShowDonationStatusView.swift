//
//  ShowDonationStatusView.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationStatusView: UIView {
    var donation: Donation
    
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
        imageView.tintColor = UIColor(named: "exclamation")
        return imageView
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Negada pelo atleta"
        return label
    }()
    
    init(frame: CGRect = .zero, donation: Donation) {
        self.donation = donation
        super.init(frame: frame)
        
        setupDescriptionLabel()
        setupIconImageView()
        setupStatusLabel()
        
        switch donation.status {
        case .confirmed:
            iconImageView.image = UIImage(systemName: "checkmark.circle.fill")
            iconImageView.tintColor = UIColor(named: "checkmark")
            
            statusLabel.text = "Confirmada pelo atleta"
            statusLabel.textColor = UIColor(named: "checkmark")
        case .pending:
            iconImageView.image = UIImage(systemName: "hourglass")
            iconImageView.tintColor = UIColor(named: "hourglass")
            
            statusLabel.text = "A confirmar pelo atleta"
            statusLabel.textColor = UIColor(named: "hourglass")
        case .rejected:
            iconImageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
            iconImageView.tintColor = UIColor(named: "exclamation")
            
            statusLabel.text = "Negada pelo atleta"
            statusLabel.textColor = UIColor(named: "exclamation")
        }
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
