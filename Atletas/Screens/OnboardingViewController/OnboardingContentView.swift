//
//  OnboardingContentView.swift
//  Atletas
//
//  Created by Giovana Garcia on 21/09/21.
//

import UIKit

class OnboardingContentView: UIView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return view
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pular", for: .normal)
        button.setTitleColor(UIColor(named: "ButtonGreen"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .light)
        return button
    }()
    
    lazy var pager: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSkipButton()
        setupPager()
        setupCollectionView()
        
    }
    
    
    func setupSkipButton() {
        addSubview(skipButton)
        skipButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-54)
            make.trailing.equalToSuperview().offset(-40)
        }
    }
    
    func setupPager() {
        addSubview(pager)
        pager.snp.makeConstraints { make in
            make.centerY.equalTo(skipButton)
            make.leading.equalToSuperview().offset(40)
        }
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(skipButton.snp.top).offset(-28)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingContentView: UICollectionViewDelegate {
    
}

extension OnboardingContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        return cell
    }
    
    
}
