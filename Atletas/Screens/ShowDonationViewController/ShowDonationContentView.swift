//
//  ShowDonationContentView.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationContentView: UIView {
    lazy var athleteView: ShowDonationAthleteView = {
        let view = ShowDonationAthleteView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var receiptView: ShowDonationReceiptView = {
        let view = ShowDonationReceiptView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupAthleteView()
        setupReceiptView()
    }
    
    func setupAthleteView() {
        addSubview(athleteView)
        athleteView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setupReceiptView() {
        addSubview(receiptView)
        receiptView.snp.makeConstraints { make in
            make.top.equalTo(athleteView.snp.bottom).offset(35)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
