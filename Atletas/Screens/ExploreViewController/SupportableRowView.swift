//
//  SupportableRowView.swift
//  Atletas
//
//  Created by André Schueda on 01/09/21.
//

import UIKit

class SupportableRowView: UIView {
    lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        collection.register(SupportableCell.self, forCellWithReuseIdentifier: "cell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    let supportables: [Supportable] = [
        Supportable(imageName: "???", text: "Tênis de mesa"),
        Supportable(imageName: "???", text: "Basquete"),
        Supportable(imageName: "???", text: "Beteombro"),
        Supportable(imageName: "???", text: "Racketbol"),
        Supportable(imageName: "???", text: "Ciclismo"),
        Supportable(imageName: "???", text: "Beteombro"),
        Supportable(imageName: "???", text: "Racketbol"),
        Supportable(imageName: "???", text: "Ciclismo")
    ]
    
    required init?(coder: NSCoder) {
        fatalError("Couldn't init well")
    }
    
    override init(frame: CGRect) {
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
    
}

extension SupportableRowView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        supportables.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SupportableCell
        cell.data = supportables[indexPath[1]]
        return cell
    }
    
    
}

extension SupportableRowView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension SupportableRowView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 120, height: 130)
    }
}
