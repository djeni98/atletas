//
//  AthleteProfileViewController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 07/09/21.
//

import UIKit
class AthleteProfileViewController: UIViewController, UITabBarDelegate {
    var athlete: Athlete? {
        didSet {
            guard let athlete = athlete else { return }

            profileHeaderView.athlete = athlete
            supportTabView.athlete = athlete
            infoTabView.athlete = athlete
        }
    }

    lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    var selectedItem: UITabBarItem?
    lazy var tabBarAndButtonView: TabBarAndSupportButtonView = {
        let view = TabBarAndSupportButtonView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tabBar.delegate = self
        view.setSupportButtonAction(self.supportButtonAction)
        selectedItem = view.tabBar.selectedItem

        return view
    }()

    lazy var supportTabView: AthleteSupportTabView = {
        let view = AthleteSupportTabView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let projects: [Project] = ProjectDataModule.shared.projects.map { $0.clone() }
        view.setProjects(projects)

        return view
    }()

    lazy var infoTabView: AthleteInfoTabView = {
        let view = AthleteInfoTabView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false

        return scrollView
    }()

    lazy var scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 16

        return view
    }()

    override func loadView() {
        super.loadView()
        view.backgroundColor = UIColor(named: "background")
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        supportTabView.navigationController = navigationController
    }

    func setup() {
        setupScroll()
        addSectionsToContainer()

        selectSupportTabView()
    }

    func setupScroll() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)

        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.layoutMarginsGuide.snp.bottom)
        }

        scrollViewContainer.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets(top: 0, left: 0, bottom: 32, right: 0))
            // this is important for scrolling
            make.width.equalTo(scrollView)
        }
    }

    func addSectionsToContainer() {
        scrollViewContainer.addArrangedSubview(profileHeaderView)
        scrollViewContainer.addArrangedSubview(tabBarAndButtonView)
        scrollViewContainer.addArrangedSubview(supportTabView)
        scrollViewContainer.addArrangedSubview(infoTabView)
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item == selectedItem { return }

        selectedItem = item
        if item.tag == 0 {
            selectSupportTabView()
        } else if item.tag == 1 {
            selectInfoTabView()
        }
    }

    func selectSupportTabView() {
        UIView.animate(withDuration: 0.2) {
            self.infoTabView.alpha = 0
            self.supportTabView.alpha = 1
        } completion: { _ in
            self.supportTabView.isHidden = false
            self.infoTabView.isHidden = true
        }
    }

    func selectInfoTabView() {
        UIView.animate(withDuration: 0.2) {
            self.infoTabView.alpha = 1
            self.supportTabView.alpha = 0
        } completion: { _ in
            self.supportTabView.isHidden = true
            self.infoTabView.isHidden = false
        }
    }

    func supportButtonAction() {
        guard let project = athlete?.projects.first else { return }
        let projectVC = ShowProjectViewController()
        projectVC.project = project

        let viewController = UINavigationController(rootViewController: projectVC)
        viewController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(viewController, animated: true, completion: nil)
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
