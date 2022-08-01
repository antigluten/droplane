//
//  AppDependencies.swift
//  droplane
//
//  Created by Vladimir Gusev on 22.07.2022.
//

import UIKit

class AppDependencies {

    init() {
        configureDependencies()
    }

    func installRootViewControllerIntoWindow(_ window: UIWindow) {

        let viewController = MainTabbarController()
        let navigationController = UINavigationController(rootViewController: viewController)

        window.rootViewController = navigationController
    }

    func configureDependencies() {

    }

}
