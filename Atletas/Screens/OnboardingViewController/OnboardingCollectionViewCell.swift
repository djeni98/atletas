//
//  OnboardingCollectionViewCell.swift
//  Atletas
//
//  Created by Giovana Garcia on 21/09/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35
        imageView.backgroundColor = .gray
        return imageView
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBackgroundImageView()
        setupSubtitleLabel()
        setupTitleLabel()
    }
    
    func setupBackgroundImageView() {
        addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupSubtitleLabel() {
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-60)
        }
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(subtitleLabel.snp.top).offset(-40)
        }
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
