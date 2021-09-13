//
//  SupporterAccountHeaderView.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class SupporterAccountHeaderView: UIView {
    var data: Supporter? {
        didSet {
            switch data?.level {
            case .noLevel:
                imageView.image = nil
                subtitleLabel.text = "Apoiador sem nível"
            case .bronze:
                imageView.image = UIImage(named: "bronze")
                subtitleLabel.text = "Apoiador nível bronze"
            case .silver:
                imageView.image = UIImage(named: "silver")
                subtitleLabel.text = "Apoiador nível prata"
            case .gold:
                imageView.image = UIImage(named: "gold")
                subtitleLabel.text = "Apoiador nível ouro"
            case .platinum:
                imageView.image = UIImage(named: "platinum")
                subtitleLabel.text = "Apoiador nível platina"
            case .diamond:
                imageView.image = UIImage(named: "diamond")
                subtitleLabel.text = "Apoiador nível diamante"
            default:
                imageView.image = nil
            }
            
            titleLabel.text = data?.name
        }
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 28
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight: .semibold)
        label.textColor = UIColor(named: "PrimaryFont")
        
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(named: "SecondaryFont")
        label.text = "Veja seu perfil"
        
        return label
    }()
    
    lazy var chevronImage: UIImageView = {
        let config = UIImage.SymbolConfiguration(pointSize: 16)
        let image = UIImage(systemName: "chevron.right", withConfiguration: config)
        let imageView = UIImageView(image: image)
        imageView.tintColor = UIColor(r: 169, g: 169, b: 169)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
        setupChevron()
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
        }
    }
    
    func setupChevron() {
        self.addSubview(chevronImage)
        chevronImage.snp.makeConstraints { make in
            make.centerY.equalTo(imageView)
            make.trailing.equalToSuperview().offset(-4)
        }
    }
    
    func setupTitle() {
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.bottom.equalTo(imageView.snp.centerY)
            
            make.leading.equalTo(imageView.snp.trailing).offset(12)
            make.trailing.equalTo(chevronImage.snp.leading).offset(-12)
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
