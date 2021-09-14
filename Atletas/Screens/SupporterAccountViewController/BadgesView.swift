//
//  BadgesView.swift
//  Atletas
//
//  Created by André Schueda on 13/09/21.
//

import UIKit

class BadgesView: UIView {
    var badges: [Badge]
    
    lazy var headerView: TitleAndShowMoreButtonView = {
        let view = TitleAndShowMoreButtonView()
        view.setTitle(withText: "Badges")
        view.setShowMoreAction {
            print("TODO clicou no ver mais")
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    init(frame: CGRect = .zero, badges: [Badge]) {
        self.badges = badges
        super.init(frame: frame)
        
        setupHeaderView()
        setupBadgesCollectionView()
    }
    
    func setupHeaderView() {
        addSubview(headerView)
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(22)
            make.trailing.equalToSuperview().offset(-22)
        }
    }
    
    func setupBadgesCollectionView() {
        addSubview(badgesBackgroundView)
        badgesBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(12)
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
    
}

extension BadgesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "badge", for: indexPath) as! BadgeCollectionViewCell
        cell.badge = Badge(name: "maguu", image: UIImage())
        return cell
    }
}

extension BadgesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 75, height: 85)
    }
}
