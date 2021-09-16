//
//  DonationsViewController.swift
//  Atletas
//
//  Created by André Schueda on 03/09/21.
//

import UIKit

class DonationsViewController: UIViewController {
    var donationsByMonth: [String:[Donation]]
    
    lazy var content: DonationsContentView = {
        let content = DonationsContentView(donationsByMonth: donationsByMonth, navigationController: navigationController)
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
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
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
    
    init(donationsByMonth: [String:[Donation]]) {
        self.donationsByMonth = donationsByMonth
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
