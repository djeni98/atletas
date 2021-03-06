//
//  ShowDonationContentView.swift
//  Atletas
//
//  Created by André Schueda on 14/09/21.
//

import UIKit

class ShowDonationContentView: UIView {
    var donation: Donation
    
    lazy var athleteView: ShowDonationAthleteView = {
        let view = ShowDonationAthleteView(donation: donation)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var receiptView: ShowDonationReceiptView = {
        let view = ShowDonationReceiptView(donation: donation)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dateView: ShowDonationDateView = {
        let view = ShowDonationDateView(donation: donation)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statusView: ShowDonationStatusView = {
        let view = ShowDonationStatusView(donation: donation)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init(frame: CGRect = .zero, donation: Donation) {
        self.donation = donation
        super.init(frame: frame)
        
        setupAthleteView()
        setupReceiptView()
        setupDateView()
        setupStatusView()
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
    
    func setupDateView() {
        addSubview(dateView)
        dateView.snp.makeConstraints { make in
            make.top.equalTo(receiptView.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
    }
    
    func setupStatusView() {
        addSubview(statusView)
        statusView.snp.makeConstraints { make in
            make.top.equalTo(dateView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
