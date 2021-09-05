//
//  DonationCell.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationCell: UITableViewCell {
    var data: Donation? {
        didSet {
//            self.supporter = data?.supporter
            projectLabel.text = data?.project
            valueLabel.text = "R$ \(Int(data?.supporterAmount ?? 0)),00"
            
            switch data?.status {
            case .confirmed:
                statusImage.image = UIImage(systemName: "checkmark.circle.fill")
                statusImage.tintColor = UIColor(named: "checkmark")
            case .pending:
                statusImage.image = UIImage(systemName: "hourglass")
                statusImage.tintColor = UIColor(named: "hourglass")
            case .rejected:
                statusImage.image = UIImage(systemName: "exclamationmark.triangle.fill")
                statusImage.tintColor = UIColor(named: "exclamation")
            case .none:
                statusImage.image = UIImage(systemName: "exclamationmark.triangle.fill")
                statusImage.tintColor = UIColor(named: "exclamation")
            }
        }
    }
    
    
    lazy var donationView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = UIColor(named: "donationCell")
        return contentView
    }()
    
    lazy var supporterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.image = UIImage(named: "???")!
        return imageView
    }()
    
    lazy var projectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.tintColor = UIColor(named: "donationText")
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 26, weight: .semibold)
        label.tintColor = UIColor(named: "donationText")
        return label
    }()
    
    lazy var chevronImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = UIColor(named: "donationText")
        return imageView
    }()

    
    lazy var statusImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    required init?(coder: NSCoder) {
        fatalError("Couldn't initialize well")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        addSubview(donationView)
        donationView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-6)
            make.height.equalTo(70)
        }
        
        donationView.addSubview(supporterImage)
        supporterImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(44)
            make.height.equalTo(44)
        }
        
        donationView.addSubview(projectLabel)
        projectLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalTo(supporterImage.snp.trailing).offset(10)
        }
        
        donationView.addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.leading.equalTo(supporterImage.snp.trailing).offset(10)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        donationView.addSubview(chevronImage)
        chevronImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
        
        donationView.addSubview(statusImage)
        statusImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(chevronImage.snp.leading).offset(-20)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
    }

}
