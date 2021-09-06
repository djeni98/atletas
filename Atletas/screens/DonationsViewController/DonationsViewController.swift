//
//  DonationsViewController.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationsViewController: UIViewController {
    
    lazy var content: DonationsContentView = {
        let content = DonationsContentView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    override func loadView() {
        super.loadView()
        
        setupContent()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        content.updateHeaderViewHeight()
    }

    func setupContent() {
        view.addSubview(content)
        content.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let navBar = navigationController?.navigationBar else { return }
        navBar.prefersLargeTitles = true
        navigationItem.title = "Doações"
        navBar.sizeToFit()
        view.backgroundColor = UIColor(named: "background")
    }
}









//#if DEBUG
//import SwiftUI
//struct DonationsViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().previewDevice("iPhone 12")
//    }
//
//    struct ContentView: UIViewControllerRepresentable {
//
//        func makeUIViewController(context: Context) -> UIViewController {
//            let navigationController = UINavigationController(rootViewController: DonationsViewController())
//            navigationController.setNavigationBarHidden(true, animated: true)
//
//            return navigationController
//        }
//
//        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
//        }
//    }
//}
//#endif
