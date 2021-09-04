//
//  DonationsContentView.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationsContentView: UIView {
    
    lazy var donationsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DonationCell.self, forCellReuseIdentifier: "donation")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = UIColor(named: "background")
        
        return tableView
    }()
    
//    lazy var donationTableTitleView: DonationsTableTitleView = {
//        let tableView = DonationsTableTitleView()
//        tableView.backgroundColor = .red
//        tableView.snp.makeConstraints { make in
//            make.height.equalTo(50)
//        }
//
//        return tableView
//    }()
//
//    override func willMove(toSuperview newSuperview: UIView?) {
//         super.willMove(toSuperview: newSuperview)
//        donationsTableView.tableHeaderView = donationTableTitleView
//       }
    
    var months: [MonthDonations] = [
        MonthDonations(month: "Julho", donations: [
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .confirmed, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .rejected, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta")
        ]),
        MonthDonations(month: "Junho", donations: [
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 40, athleteAmount: 50, status: .pending, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta"),
            Donation(receiptImage: UIImage(named: "???")!, supporter: "Zé", supporterAmount: 50, athleteAmount: 50, status: .pending, project: "Renda Atleta")
        ])
    ]
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(donationsTableView)
        donationsTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
    }
}

extension DonationsContentView: UITableViewDelegate {
    
}

extension DonationsContentView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        months.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return months[section].donations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = donationsTableView.dequeueReusableCell(withIdentifier: "donation", for: indexPath) as! DonationCell
        cell.data = months[indexPath.section].donations[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DonationsTableSubheaderView()
        view.text = months[section].month
        view.backgroundColor = UIColor(named: "background")
        return view
    }
    
}
