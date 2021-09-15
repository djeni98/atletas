//
//  ShowDonationReceiptView.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationReceiptView: UIView {
    var donation: Donation
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .left
        label.text = "Comprovante Pix"
        label.textColor = UIColor(named: "ShowDonationFont")
        return label
    }()
    
    lazy var receiptImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = donation.receiptImage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    init(frame: CGRect = .zero, donation: Donation) {
        self.donation = donation
        super.init(frame: frame)
        
        setupSubtitleLabel()
        setupReceiptImageView()
    }
    
    func setupSubtitleLabel() {
        addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    
    func setupReceiptImageView() {
        addSubview(receiptImageView)
        receiptImageView.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.height * 0.25)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
