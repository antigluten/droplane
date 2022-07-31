//
//  MainTabbarController.swift
//  droplane
//
//  Created by Vladimir Gusev on 31.07.2022.
//

import UIKit

final class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchVC = MainViewController()
        let profileVC = UIViewController()
        profileVC.view.backgroundColor = .systemBackground
        
        viewControllers = [
            createNavController(searchVC, title: "Search", imageName: "magnifyingglass.circle.fill"),
            createNavController(profileVC, title: "Profile", imageName: "person.crop.circle.fill")
        ]
    }
    
    func createNavController(_ viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.tabBarItem.title = title
        
        return navController
    }
}
