//
//  ProjectImageView.swift
//  Atletas
//
//  Created by André Schueda on 05/09/21.
//

import UIKit

class ProjectImageView: UIView {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "???")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var darkeningLayer: UIView = {
        let layer = UIView()
        layer.translatesAutoresizingMaskIntoConstraints = false
        layer.layer.cornerRadius = 8
        layer.backgroundColor = .init(white: 0, alpha: 0.5)
        return layer
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(for: .title2, weight: .bold)
        label.adjustsFontForContentSizeCategory = true
        label.text = "Ljhsd khfaasdlkajsdjkalsks"
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("abuble")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupImage()
        setupTitleLabel()
    }
    
    func setupImage() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
        }
    }
}
