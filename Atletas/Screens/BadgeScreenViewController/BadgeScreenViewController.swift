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
    
    lazy var texto1: UILabel = {
        let texto1 = UILabel()
        texto1.translatesAutoresizingMaskIntoConstraints = false
        texto1.text = "15 Doações"
        texto1.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        texto1.numberOfLines = 2
        texto1.textAlignment = NSTextAlignment.center
        return texto1
    }()
    
    lazy var texto2: UILabel = {
        let texto2 = UILabel()
        texto2.translatesAutoresizingMaskIntoConstraints = false
        texto2.text = "Você recebeu esse badge por ter apoiado\nno esporte 15 vezes em 2021."
        texto2.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        texto2.textAlignment = .center
        texto2.numberOfLines = 2
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
    
    lazy var badgeView: BadgeView = {
        let badgeView = BadgeView(frame: .zero)
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.backgroundColor = UIColor(named: "background")
        
        return badgeView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background")
        guard let naviBar = navigationController?.navigationBar else { return }
        naviBar.prefersLargeTitles = true
        navigationItem.title = "Badge x"
        naviBar.sizeToFit()
        view.addSubview(badgeView)
        badgeView.snp_makeConstraints { (make) in
            make.top.equalTo(view).offset(160)
            make.height.equalTo(258)
            make.centerX.equalTo(view.center.x)
            make.width.equalTo(258)
        }
        
        
        setupText1(content: texto1)
        setupText2(content: texto2)
        setupButton(content: buyButton)
        setupSeeMoreButton(content: seeMoreButton)
        
        
        
    }
    func setupText1(content: UIView) {
        view.addSubview(content)
       
        content.snp_makeConstraints { (make) in
            make.top.equalTo(badgeView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            
            
        }
    }
    func setupText2(content: UIView) {
        view.addSubview(content)
        content.snp_makeConstraints { (make) in
            make.top.equalTo(texto1.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            
        }
    }
    
    func setupButton(content: UIView) {
        view.addSubview(content)
        content.snp_makeConstraints { (make) in
            make.top.equalTo(texto2.snp.bottom).offset(38)
            make.centerX.equalToSuperview()
            
        }
    }
    
    func setupSeeMoreButton(content: UIView) {
        view.addSubview(content)
        content.snp_makeConstraints { (make) in
            make.top.equalTo(buyButton.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
            
        }
    }
    
}

//extension UIViewController {
//    func add(_ child: UIViewController) {
//        addChild(child)
//        view.addSubview(child.view)
//        child.didMove(toParent: self)
//    }
//}



#if DEBUG
import SwiftUI
struct BadgeScreenViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            let vc = BadgeScreenViewController()
            let navigationController = UINavigationController(rootViewController: vc)

            return navigationController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif

