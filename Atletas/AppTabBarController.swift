//
//  AppTabBarController.swift
//  Atletas
//
//  Created by Djenifer Renata Pereira on 10/09/21.
//

import UIKit

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = 0

        let viewControllers = [getExploreView(), getSearchView(), getProfileView()]
        setViewControllers(viewControllers, animated: false)
    }

    private func getExploreView() -> UIViewController {
        let viewController = UINavigationController(rootViewController: ShowDonationViewController())
        viewController.tabBarItem = UITabBarItem(title: "Explorar", image: UIImage(systemName: "safari.fill"), tag: 0)

        return viewController
    }

    private func getSearchView() -> UIViewController {
        let viewController = UINavigationController(rootViewController: SearchViewController())
        viewController.tabBarItem = UITabBarItem(title: "Buscar", image: UIImage(systemName: "magnifyingglass"), tag: 1)

        return viewController
    }

    private func getProfileView() -> UIViewController {
        // TODO: select profile view when is a supporter
        let selectedProfileView = AthleteAccountViewController()
        let viewController = UINavigationController(rootViewController: selectedProfileView)
        viewController.tabBarItem = UITabBarItem(title: "Conta", image: UIImage(systemName: "person.fill"), tag: 2)

        return viewController
    }
}
