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
        tableView.tableHeaderView = donationTableTitleView
        
        return tableView
    }()
    
    lazy var donationTableTitleView: DonationsTableTitleView = {
        let view = DonationsTableTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()
    
    
    var months: [MonthDonations] = [
        MonthDonations(
            month: "Julho",
            donations: DonationDataModule.shared.donations.shuffled().slice(0..<5).sorted { $0.status < $1.status }
        ),
        MonthDonations(
            month: "Junho",
            donations: DonationDataModule.shared.donations.shuffled().slice(0..<5).sorted { $0.status < $1.status }
        ),
        MonthDonations(
            month: "Maio",
            donations: DonationDataModule.shared.donations.shuffled().slice(0..<5).sorted { $0.status < $1.status }
        ),
        MonthDonations(
            month: "Abril",
            donations: DonationDataModule.shared.donations.shuffled().slice(0..<5).sorted { $0.status < $1.status }
        ),
    ]
    
    func updateHeaderViewHeight() {
        guard let header = donationsTableView.tableHeaderView else { return }
        header.frame.size.height = header.systemLayoutSizeFitting(CGSize(width: self.frame.width - 32.0, height: 0)).height
    }
    
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
