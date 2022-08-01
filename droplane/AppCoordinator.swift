//
//  AppCoordinator.swift
//  droplane
//
//  Created by Vladimir Gusev on 01.08.2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    var type: CoordinatorType = .main
    var childCoordinators = [Coordinator]()
    
    private(set) var rootViewController: UITabBarController
    
    init(rootViewController: UITabBarController = UITabBarController()) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let searchCoordinator = SearchCoordinator()
        searchCoordinator.start()
        searchCoordinator.setUpParent(to: self)
        addViewController(viewController: searchCoordinator.rootViewController, title: "Search", icon: "magnifyingglass.circle.fill")
        childCoordinators.append(searchCoordinator)
    }
    
    private func addViewController(viewController: UIViewController, title: String, icon: String) {
        let iconImage = UIImage(systemName: icon)
        
        let tabBarItem = UITabBarItem(title: title, image: iconImage, tag: childCoordinators.count)
        viewController.tabBarItem = tabBarItem
        
        rootViewController.addChild(viewController)
    }
}
