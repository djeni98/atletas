//
//  ExploreContentView.swift
//  Atletas
//
//  Created by André Schueda on 02/09/21.
//

import UIKit

class ExploreContentView: UIView {

    lazy var exploreCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(SportsCell.self, forCellWithReuseIdentifier: SportsCell.identifier)
        collection.register(AthletesCell.self, forCellWithReuseIdentifier: AthletesCell.identifier)
        collection.register(ProjectsCell.self, forCellWithReuseIdentifier: ProjectsCell.identifier)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    required init?(coder: NSCoder) {
        fatalError("abuble")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(exploreCollection)
        exploreCollection.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}


extension ExploreContentView: UICollectionViewDelegate {
    
}

extension ExploreContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = exploreCollection.dequeueReusableCell(withReuseIdentifier: SportsCell.identifier, for: indexPath) as! SportsCell
            return cell
        case 1:
            let cell = exploreCollection.dequeueReusableCell(withReuseIdentifier: AthletesCell.identifier, for: indexPath) as! AthletesCell
            return cell
        case 2:
            let cell = exploreCollection.dequeueReusableCell(withReuseIdentifier: ProjectsCell.identifier, for: indexPath) as! ProjectsCell
            return cell
        default:
            let cell = exploreCollection.dequeueReusableCell(withReuseIdentifier: SportsCell.identifier, for: indexPath) as! SportsCell
            return cell
        }
    }
}

extension ExploreContentView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: frame.size.width, height: 190)
        case 1:
            return CGSize(width: frame.size.width, height: 190)
        case 2:
            return CGSize(width: frame.size.width, height: 210)
        default:
            return CGSize(width: frame.size.width, height: 190)
        }
    }
}
