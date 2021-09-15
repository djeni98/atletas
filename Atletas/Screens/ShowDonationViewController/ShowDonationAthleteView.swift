//
//  ShowDonationAthleteView.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationAthleteView: UIView {
    lazy var athleteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        label.text = "R$ 50,00"
        return label
    }()
    
    lazy var athleteNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        label.text = "Nome do Atleta"
        label.textColor = UIColor(named: "ShowDonationFont")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAthleteImageView()
        setupValueLabel()
        setupAthleteNameLabel()
    }
    
    func setupAthleteImageView() {
        addSubview(athleteImageView)
        athleteImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalTo(44)
        }
    }
    
    func setupValueLabel() {
        addSubview(valueLabel)
        valueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(1)
            make.leading.equalTo(athleteImageView.snp.trailing).offset(14)
        }
    }
    
    func setupAthleteNameLabel() {
        addSubview(athleteNameLabel)
        athleteNameLabel.snp.makeConstraints { make in
            make.top.equalTo(valueLabel.snp.bottom).offset(2)
            make.leading.equalTo(athleteImageView.snp.trailing).offset(14)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
