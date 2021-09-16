//
//  SupporterAccountHeaderView.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class SupporterAccountHeaderView: UIView {
    var supporter: Supporter
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 28
        imageView.backgroundColor = .gray
        imageView.image = supporter.image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.textColor = UIColor(named: "PrimaryFont")
        label.text = supporter.name
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "SecondaryFont")
        label.text = "Apoiador nível diamante"
        
        return label
    }()
    
    init(frame: CGRect = .zero, supporter: Supporter) {
        self.supporter = supporter
        super.init(frame: frame)
        
        setupImageView()
        setupTitle()
        setupSubtitle()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(56)
            make.height.equalTo(56)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupTitle() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.bottom.equalTo(imageView.snp.centerY)
            
            make.leading.equalTo(imageView.snp.trailing).offset(12)
        }
    }
    
    func setupSubtitle() {
        self.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.centerY)
            make.bottom.equalToSuperview().offset(-4)
            
            make.leading.equalTo(titleLabel)
            make.trailing.equalTo(titleLabel)
        }
    }
}
