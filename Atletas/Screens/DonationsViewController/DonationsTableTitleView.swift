//
//  TitleTableViewCell.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationsTableTitleView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minhas doações"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        return label
    }()

    required init?(coder: NSCoder) {
        fatalError("Couldn't initialize well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22).priority(.high)
            make.bottom.equalToSuperview().offset(5).priority(.high)
        }
    }
    

}
