//
//  OnboardingContentView.swift
//  Atletas
//
//  Created by Giovana Garcia on 21/09/21.
//

import UIKit

class OnboardingContentView: UIView {
    let navigationController: UINavigationController?
        
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
        button.addTarget(self, action: #selector(clickedSkipButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickedSkipButton() {
        navigationController?.pushViewController(AppTabBarController(), animated: true)
        print("botao")
    }

    lazy var pager: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = UIColor(named: "ButtonGreen")
        pageControl.currentPageIndicatorTintColor = UIColor(named: "ButtonGreen")
        pageControl.numberOfPages = onboardingCards.count
        pageControl.backgroundStyle = .minimal
        pageControl.isUserInteractionEnabled = false
        pageControl.preferredIndicatorImage = UIImage(named: "circle_border")
        pageControl.setIndicatorImage(UIImage(named: "circle_fill"), forPage: 0)
        return pageControl
    }()
    
    init(frame: CGRect = .zero, navigationController: UINavigationController?) {
        self.navigationController = navigationController
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
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalTo(skipButton)
            
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width - scrollView.contentInset.left * 2
        let index = scrollView.contentOffset.x / width
        let roundedIndex = round(index)
        pager.currentPage = Int(roundedIndex)
        
        (0..<pager.numberOfPages).forEach { index in
            let activeImage = UIImage(named: "circle_fill")
            let otherImage = UIImage(named: "circle_border")
            let pageIcon = index == pager.currentPage ? activeImage : otherImage
            pager.setIndicatorImage(pageIcon, forPage: index)
        }
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


