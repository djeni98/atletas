//
//  BadgeCollectionViewCell.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class BadgeCollectionViewCell: UICollectionViewCell {
    var badgeImage: UIImage? {
        didSet {
            badgeImageView.image = badgeImage
        }
    }
    
    lazy var badgeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        addSubview(badgeImageView)
        badgeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
