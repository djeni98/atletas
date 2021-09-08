//
//  AthleteProfileViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 07/09/21.
//

import UIKit

class AthleteProfileViewController: UIViewController {

    lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var tabBarAndButtonView: TabBarAndSupportButtonView = {
        let view = TabBarAndSupportButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // change navBar
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func setup() {
        view.addSubview(profileHeaderView)
        view.addSubview(tabBarAndButtonView)

        profileHeaderView.snp.makeConstraints { make in
            make.top.equalToSuperview()

            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }

        tabBarAndButtonView.snp.makeConstraints { make in
            make.top.equalTo(profileHeaderView.snp.bottom).offset(16)

            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

#if DEBUG
import SwiftUI
struct AthleteProfileViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            let vc = AthleteProfileViewController()
            let navigationController = UINavigationController(rootViewController: vc)

            return navigationController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif
