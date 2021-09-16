//
//  AppTabBarController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 10/09/21.
//

import UIKit

class AppTabBarController: UITabBarController {
    var dataModule = DataModule.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 0

        let viewControllers = [getExploreView(), getSearchView(), getProfileView()]
        setViewControllers(viewControllers, animated: false)
    }

    private func getExploreView() -> UIViewController {
        let viewController = UINavigationController(rootViewController: ExploreViewController())
        viewController.tabBarItem = UITabBarItem(title: "Explorar", image: UIImage(systemName: "safari.fill"), tag: 0)
        viewController.navigationBar.prefersLargeTitles = true

        return viewController
    }

    private func getSearchView() -> UIViewController {
        let viewController = UINavigationController(rootViewController: SearchViewController())
        viewController.tabBarItem = UITabBarItem(title: "Buscar", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        viewController.navigationBar.prefersLargeTitles = true

        return viewController
    }

    private func getProfileView() -> UIViewController {
        let selectedProfileView = SupporterAccountViewController()
        let viewController = UINavigationController(rootViewController: selectedProfileView)
        viewController.tabBarItem = UITabBarItem(title: "Conta", image: UIImage(systemName: "person.fill"), tag: 2)
        viewController.navigationBar.prefersLargeTitles = true

        return viewController
    }
}
