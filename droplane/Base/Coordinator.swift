//
//  Coordinator.swift
//  droplane
//
//  Created by Vladimir Gusev on 01.08.2022.
//

import Foundation

protocol Coordinator: AnyObject {
    var type: CoordinatorType { get }
    var childCoordinators: [Coordinator] { get set }
    
    func start()
    func childDidFinish(_ child: Coordinator?)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator?) {
        _ = childCoordinators.firstIndex(where: { $0.type == child?.type }).flatMap { childCoordinators.remove(at: $0) }
    }
}
