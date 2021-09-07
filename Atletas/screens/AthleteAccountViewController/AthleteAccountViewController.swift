//
//  AthleteAccountViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 05/09/21.
//

import UIKit

class AthleteAccountViewController: UIViewController {
    lazy var accountHeaderView: AccountHeaderView = {
        let view = AccountHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var donationView: ShowMoreDonationsSectionView = {
        let view = ShowMoreDonationsSectionView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var projectView: ShowMoreProjectsSectionView = {
        let view = ShowMoreProjectsSectionView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        setup()
    }

    func setup() {
        view.addSubview(accountHeaderView)

        accountHeaderView.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.top).offset(32)

            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        view.addSubview(donationView)

        donationView.snp.makeConstraints { make in
            make.top.equalTo(accountHeaderView.snp.bottom).offset(32)

            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

        view.addSubview(projectView)

        projectView.snp.makeConstraints { make in
            make.top.equalTo(donationView.snp.bottom).offset(32)

            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }

    }

}

#if DEBUG
import SwiftUI
struct AthleteAccountViewController_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
    }

    struct ContentView: UIViewControllerRepresentable {

        func makeUIViewController(context: Context) -> UIViewController {
            let vc = AthleteAccountViewController()
            let navigationController = UINavigationController(rootViewController: vc)

            return navigationController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
}
#endif
