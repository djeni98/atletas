//
//  CopyButtonContentView.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class CopyButtonContentView: UIView {
    lazy var copyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = UIColor(named: "ButtonGreen")
        imageView.image = UIImage(systemName: "square.on.square.dashed")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCopyImageVivew()
    }
    
    func setupCopyImageVivew() {
        addSubview(copyImageView)
        copyImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
