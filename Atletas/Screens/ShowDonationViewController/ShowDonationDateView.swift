//
//  ShowDonationDateView.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationDateView: UIView {
    var donation: Donation
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "Data:"
        label.textColor = UIColor(named: "ShowDonationFont")
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = donation.dateString
        label.textColor = UIColor(named: "ShowDonationFont")
        return label
    }()

    init(frame: CGRect = .zero, donation: Donation) {
        self.donation = donation
        super.init(frame: frame)
        
        setupDescriptionLabel()
        setupDateLabel()
    }
    
    func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupDateLabel() {
        addSubview(dateLabel)
        dateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
