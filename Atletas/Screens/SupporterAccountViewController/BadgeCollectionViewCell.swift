//
//  BadgeCollectionViewCell.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class BadgeCollectionViewCell: UICollectionViewCell {
    var badge: Badge? {
        didSet {
            
        }
    }
    
    lazy var darkeningLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(named: "badge")
        
        return view
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        addSubview(darkeningLayer)
        darkeningLayer.snp.makeConstraints { make in
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
