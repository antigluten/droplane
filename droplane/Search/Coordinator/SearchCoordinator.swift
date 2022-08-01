//
//  SearchCoordinator.swift
//  droplane
//
//  Created by Vladimir Gusev on 01.08.2022.
//

import UIKit

final class SearchCoordinator: Coordinator {
    
    enum Router {
        case profile
        case detail
    }
    
    var type: CoordinatorType = .search
    var childCoordinators = [Coordinator]()
    
    // TODO: LEARN ABOUT IT AND IF IT'S NOT COOL, REMOVE
    var selectedPlace: Place?
    
    private(set) var rootViewController: UINavigationController
    weak private(set) var parentCoordinator: Coordinator?
    
    init(rootViewController: UINavigationController = UINavigationController()) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let viewController = SearchViewController()
        viewController.coordinator = self
        rootViewController.addChild(viewController)
    }
    
    func transition(for route: Router) {
        switch route {
        case .profile:
            fatalError("Profile routing not implemented yet")
        case .detail:
            print("")
            
        }
    }
    
    func navigate(to route: Router, with place: Place) {
        switch route {
        case .profile:
            fatalError("Profile routing not implemented yet")
        case .detail:
            let viewController = PlaceDetailsViewController(place: place)
            
            // TODO: Should I push or just present my controller
            rootViewController.pushViewController(viewController, animated: true)
        }
    }
    
    func setUpParent(to coordinator: Coordinator) {
        parentCoordinator = coordinator
    }
}
