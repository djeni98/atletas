//
//  AthleteAccountViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 05/09/21.
//

import UIKit

class AthleteAccountViewController: UIViewController {
    var athlete: Athlete? {
        didSet {
            guard let athlete = athlete else { return }

            accountHeaderView.imageView.image = athlete.image
            accountHeaderView.titleLabel.text = athlete.getFirstName()
            accountHeaderView.subtitleLabel.text = "Veja seu perfil"

            let donations = athlete.getDonations().slice(0..<3)
            donationView.setDonations(donations)

            let projects = athlete.projects.slice(0..<3)
            projectView.setProjects(projects)
        }
    }

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

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 32

        return view
    }()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBackground
        setup()
    }

    func setup() {
        setupScroll()
        addSectionsToContainer()
    }

    func setupScroll() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        let offset: CGFloat = 24
        scrollViewContainer.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 32, left: offset, bottom: 32, right: offset))
            // this is important for scrolling
            make.width.equalTo(scrollView).offset(-offset * 2)
        }
    }

    func addSectionsToContainer() {
        scrollViewContainer.addArrangedSubview(accountHeaderView)
        scrollViewContainer.addArrangedSubview(donationView)
        scrollViewContainer.addArrangedSubview(projectView)
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