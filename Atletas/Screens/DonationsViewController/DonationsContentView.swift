//
//  DonationsContentView.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationsContentView: UIView {
    var donationsByMonth: [String:[Donation]]
    
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
    
    func updateHeaderViewHeight() {
        guard let header = donationsTableView.tableHeaderView else { return }
        header.frame.size.height = header.systemLayoutSizeFitting(CGSize(width: self.frame.width - 32.0, height: 0)).height
    }
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init")
    }
    
    init(frame: CGRect = .zero, donationsByMonth: [String: [Donation]]) {
        self.donationsByMonth = donationsByMonth
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
        donationsByMonth.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donationsByMonth[section].value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = donationsTableView.dequeueReusableCell(withIdentifier: "donation", for: indexPath) as! DonationCell
        cell.donation = donationsByMonth[indexPath.section].value[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DonationsTableSubheaderView()
        view.text = donationsByMonth[section].key
        view.backgroundColor = UIColor(named: "background")
        return view
    }
    
}
