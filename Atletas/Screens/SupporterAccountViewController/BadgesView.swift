//
//  BadgesView.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class BadgesView: UIView {
    var navigationController: UINavigationController?
    var badges: [Badge]
    var achievedBadges: [String:Bool]
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Badges"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .left
        
        return label
    }()
    
    lazy var badgesBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "donationCell")
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    lazy var badgesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 18
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BadgeCollectionViewCell.self, forCellWithReuseIdentifier: "badge")
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    init(frame: CGRect = .zero, badges: [Badge], achievedBadges: [String:Bool], navigationController: UINavigationController?) {
        self.badges = badges
        self.achievedBadges = achievedBadges
        self.navigationController = navigationController
        super.init(frame: frame)
        
        setupHeaderView()
        setupBadgesCollectionView()
    }
    
    func setupHeaderView() {
        addSubview(headerLabel)
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
        }
    }
    
    func setupBadgesCollectionView() {
        addSubview(badgesBackgroundView)
        badgesBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview()
        }
        
        badgesBackgroundView.addSubview(badgesCollectionView)
        badgesCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BadgesView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let badgeVC = UINavigationController(rootViewController:
                                                BadgeScreenViewController(badge: badges[indexPath.row],
                                                                                           isAchieved: achievedBadges[badges[indexPath.row].objectName] ?? false))
        navigationController?.present(badgeVC, animated: true, completion: nil)
    }
}

extension BadgesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "badge", for: indexPath) as! BadgeCollectionViewCell
        let objectName = badges[indexPath.row].objectName
        let isBadgeAchieved = achievedBadges[objectName] ?? false
        
        let badgeImageName = isBadgeAchieved ? objectName : "not-achieved"
        cell.badgeImage = UIImage(named: badgeImageName)
        return cell
    }
}

extension BadgesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 75, height: 85)
    }
}
