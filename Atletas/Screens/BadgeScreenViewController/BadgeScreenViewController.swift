//
//  BadgeScreenViewController.swift
//  Atletas
//
//  Created by Guilerme Barciki on 12/09/21.
//

import Foundation
import UIKit
import SnapKit


class BadgeScreenViewController: UIViewController {
    var badge: Badge
    var isAchieved: Bool
    
    lazy var badgeView: BadgeView = {
        let badgeView = BadgeView(badge: badge)
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.backgroundColor = UIColor(named: "background")
        
        return badgeView
    }()
    
    lazy var placeholderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.image = UIImage(named: "not-achieved")
        return imageView
    }()
    
    lazy var shortDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = badge.shortDescription
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    lazy var detailedDescription: UILabel = {
        let texto2 = UILabel()
        texto2.translatesAutoresizingMaskIntoConstraints = false
        texto2.text = isAchieved ? badge.detailedDescription : badge.toAchieveDescription
        texto2.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        texto2.textAlignment = .center
        texto2.numberOfLines = 0
        return texto2
    }()
    
    private lazy var buyButton: GreenRoundedButton = {
        let buyButton = GreenRoundedButton.getBuyButton()
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        return buyButton
    }()
    
    private lazy var seeMoreButton: UIButton = {
        let seeMoreButton = UIButton()
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButton.setTitle("saiba mais", for: .normal)
        seeMoreButton.setTitleColor(.black, for: .normal)
        seeMoreButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return seeMoreButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        
        setupNavigationBar()
        if isAchieved {
            setupBadgeView()
            setupShortDescription(topView: badgeView)
        } else {
            setupPlaceholderImageView()
            setupShortDescription(topView: placeholderImageView)
        }
        
        setupDetailedDescription()
        if isAchieved {
            setupBuyButton()
        }
//        setupSeeMoreButton(content: seeMoreButton)
    }
    
    func setupNavigationBar() {
        guard let naviBar = navigationController?.navigationBar else { return }
        naviBar.prefersLargeTitles = true
        navigationItem.title = badge.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancelar", style: .plain, target: self, action: #selector(clickedCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: nil, action: nil)
        naviBar.sizeToFit()
    }
    
    @objc func clickedCancel() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func setupBadgeView() {
        view.addSubview(badgeView)
        badgeView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(160)
            make.height.equalTo(258)
            make.centerX.equalTo(view.center.x)
            make.width.equalTo(258)
        }
    }
    
    func setupPlaceholderImageView() {
        view.addSubview(placeholderImageView)
        placeholderImageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(160)
            make.height.equalTo(258)
            make.centerX.equalTo(view.center.x)
            make.width.equalTo(258)
        }
    }
    
    func setupShortDescription(topView: UIView) {
        view.addSubview(shortDescription)
        shortDescription.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setupDetailedDescription() {
        view.addSubview(detailedDescription)
        detailedDescription.snp.makeConstraints { make in
            make.top.equalTo(shortDescription.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            
        }
    }
    
    func setupBuyButton() {
        view.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(detailedDescription.snp.bottom).offset(38)
            make.centerX.equalToSuperview()
        }
    }
    
    func setupSeeMoreButton(content: UIView) {
        view.addSubview(content)
        content.snp.makeConstraints { make in
            make.top.equalTo(buyButton.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
        }
    }
    
    
    init(badge: Badge, isAchieved: Bool) {
        self.badge = badge
        self.isAchieved = isAchieved
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//extension UIViewController {
//    func add(_ child: UIViewController) {
//        addChild(child)
//        view.addSubview(child.view)
//        child.didMove(toParent: self)
//    }
//}



//#if DEBUG
//import SwiftUI
//struct BadgeScreenViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewDevice("iPhone 12")
//    }
//
//    struct ContentView: UIViewControllerRepresentable {
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            let vc = BadgeScreenViewController()
//            let navigationController = UINavigationController(rootViewController: vc)
//
//            return navigationController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//            //
//        }
//    }
//}
//#endif

