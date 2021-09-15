//
//  SupportableRowView.swift
//  Atletas
//
//  Created by André Schueda on 01/09/21.
//

import UIKit

class SupportableRowView: UIView {
    var supportables: [Supportable]
    var navigationController: UINavigationController?
    
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collection.register(SupportableCell.self, forCellWithReuseIdentifier: "cell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    init(frame: CGRect = .zero, supportables: [Supportable], navigationController: UINavigationController?) {
        self.navigationController = navigationController
        self.supportables = supportables
        super.init(frame: .zero)
        
        addSubview(collection)
        collection.backgroundColor = .clear
        collection.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SupportableRowView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        supportables.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SupportableCell
        cell.supportable = supportables[indexPath[1]]
        return cell
    }
    
    
}

extension SupportableRowView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let supportable = supportables[indexPath.row]
        switch supportable {
        case is Sport:
            let sportView = SportScreenViewController()
            let sport = supportable as! Sport
            sportView.sport = sport.sport
            
            navigationController?.show(sportView, sender: self)
            
        case is Athlete:
            let athleteView = AthleteProfileViewController()
            athleteView.athlete = supportable as? Athlete
            
            navigationController?.show(athleteView, sender: self)
            
        case is Project:
            let projectView = ShowProjectViewController()
            projectView.project = supportable as! Project
            let nav = UINavigationController(rootViewController: projectView)
            nav.modalPresentationStyle = .fullScreen
            
            navigationController?.present(nav, animated: true, completion: nil)
        default:
            return
        }
    }
}

extension SupportableRowView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 130)
    }
}
