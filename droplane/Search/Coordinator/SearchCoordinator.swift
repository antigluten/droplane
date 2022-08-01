//
//  SearchCoordinator.swift
//  droplane
//
//  Created by Vladimir Gusev on 01.08.2022.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var type: CoordinatorType = .search
    var childCoordinators = [Coordinator]()
    
    private(set) var rootViewController: UINavigationController
    private(set) var parentCoordinator: Coordinator?
    
    init(rootViewController: UINavigationController = UINavigationController()) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let viewController = SearchViewController()
        rootViewController.addChild(viewController)
    }
    
    func setUpParent(to coordinator: Coordinator) {
        parentCoordinator = coordinator
    }
}
