//
//  DonationsTableSubheaderView.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationsTableSubheaderView: UIView {
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    var text: String? {
        didSet {
            label.text = text
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-3)
        }
    }
}
