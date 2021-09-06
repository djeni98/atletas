//
//  SupportedInfoView.swift
//  Atletas
//
//  Created by André Schueda on 06/09/21.
//

import UIKit

class SupportedInfoView: UIView {
    lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Dados de quem receberá sua doação:"
        label.font = UIFont.preferredFont(for: .subheadline, weight: .regular)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTitleLabel()
    }

    func setupTitleLabel() {
        addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview()
        }
    }
}
