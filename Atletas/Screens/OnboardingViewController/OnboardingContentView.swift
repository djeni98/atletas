//
//  OnboardingContentView.swift
//  Atletas
//
//  Created by Giovana Garcia on 21/09/21.
//

import UIKit

class OnboardingContentView: UIView {
    let onboardingCards = OnboardingDataModule.shared.cards
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .clear
        view.delegate = self
        view.dataSource = self
        view.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        return view
    }()
    
    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pular", for: .normal)
        button.setTitleColor(UIColor(named: "ButtonGreen"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 22, weight: .light)
        return button
    }()
    
    // TO DO: ENTENDER COMO FUNCIONA E APLICAR
    lazy var pager: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .red
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
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.trailing.equalToSuperview().offset(-40)
        }
    }
    
    func setupPager() {
        addSubview(pager)
        pager.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.leading.equalToSuperview().offset(40)
        }
    }
    
    func setupCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(skipButton.snp.top)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingContentView: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.collectionView.scrollToNearestVisibleCollectionViewCell()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.collectionView.scrollToNearestVisibleCollectionViewCell()
        }
    }
}

extension OnboardingContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setupContent(content: onboardingCards[indexPath.row])
        return cell
    }
}

extension OnboardingContentView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = UIScreen.main.bounds.height * 0.805
        let width = height * 0.449
        return CGSize(width: width, height: height)
    }
}
