//
//  CollectionCell.swift
//  Atletas
//
//  Created by André Schueda on 01/09/21.
//

import UIKit

class SupportableCell: UICollectionViewCell {
    var data: Supportable? {
        didSet {
            guard let data = data else { return }
            label.text = data.text
            background.image = UIImage(named: data.imageName)
        }
    }
    
    lazy var background: UIImageView = {
        let background = UIImageView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode = .scaleAspectFill
        background.clipsToBounds = true
        background.layer.cornerRadius = 8
        return background
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .gray
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init hasn't been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(background)
        addSubview(label)
        
        background.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4)
            make.trailing.equalToSuperview().offset(-4)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
