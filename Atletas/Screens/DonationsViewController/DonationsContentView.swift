//
//  DonationsContentView.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationsContentView: UIView {
    var navigationController: UINavigationController?
    var sortedKeys: [String]
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
    
    init(frame: CGRect = .zero, donationsByMonth: [String: [Donation]], navigationController: UINavigationController?) {
        self.navigationController = navigationController
        self.donationsByMonth = donationsByMonth
        sortedKeys = donationsByMonth.keys.sorted(by: >)
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = sortedKeys[indexPath.section]
        let donation = donationsByMonth[key]![indexPath.row]
        
        navigationController?.present(ShowDonationViewController(donation: donation), animated: true, completion: nil)
    }
}

extension DonationsContentView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        donationsByMonth.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sortedKeys[section]
        return donationsByMonth[key]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = donationsTableView.dequeueReusableCell(withIdentifier: "donation", for: indexPath) as! DonationCell
        let key = sortedKeys[indexPath.section]
        cell.donation = donationsByMonth[key]![indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DonationsTableSubheaderView()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'/'MM"
        let date = formatter.date(from: sortedKeys[section])
        
        view.text = date?.readableDate
        
        view.backgroundColor = UIColor(named: "background")
        return view
    }
    
}
