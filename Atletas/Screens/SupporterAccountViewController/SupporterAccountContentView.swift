//
//  SupporterAccountContentView.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class SupporterAccountContentView: UIView {
    var navigationController: UINavigationController?
    var supporter: Supporter
    
    lazy var headerView: SupporterAccountHeaderView = {
        let view = SupporterAccountHeaderView(supporter: supporter)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var donationsView: SupporterDonationsView = {
        let view = SupporterDonationsView(supporter: supporter, navigationController: navigationController)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var badgesView: BadgesView = {
        let view = BadgesView(badges: supporter.badges, navigationController: navigationController)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(frame: CGRect = .zero, supporter: Supporter, navigationController: UINavigationController?) {
        self.navigationController = navigationController
        self.supporter = supporter
        super.init(frame: frame)
        
        setupHeaderView()
        setupDonationsView()
        setupBadgesView()
        
    }
    
    func setupHeaderView() {
        addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
        }
    }
    
    func setupDonationsView() {
        addSubview(donationsView)
        donationsView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(262)
        }
    }
    
    func setupBadgesView() {
        addSubview(badgesView)
        badgesView.snp.makeConstraints { make in
            make.top.equalTo(donationsView.snp.bottom).offset(40)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(260)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
