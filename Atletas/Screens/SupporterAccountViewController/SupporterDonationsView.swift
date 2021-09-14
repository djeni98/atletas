//
//  SupporterDonationsView.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class SupporterDonationsView: UIView {
    var donations: [Donation]
    
    let headerView: TitleAndShowMoreButtonView = {
        let view = TitleAndShowMoreButtonView()
        view.setTitle(withText: "Doações Recentes")
        view.setShowMoreAction {
            print("TODO clicou no ver mais")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var donationsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DonationCell.self, forCellReuseIdentifier: "donation")
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    init(frame: CGRect = .zero, donations: [Donation]) {
        self.donations = donations
        super.init(frame: frame)
        
        setupHeaderView()
        setupDonationsTableView()
    }
    
    func setupHeaderView() {
        addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
        }
    }
    
    func setupDonationsTableView() {
        addSubview(donationsTableView)
        donationsTableView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SupporterDonationsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        min(donations.count, 3)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = donationsTableView.dequeueReusableCell(withIdentifier: "donation", for: indexPath) as! DonationCell
        cell.data = donations[indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
