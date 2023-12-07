//
//  AnyCoordinator.swift
//  Coordinator Deneme
//
//  Created by Erislam Nurluyol on 7.12.2023.
//

import UIKit

protocol AnyCoordinator: AnyObject {
    
    var parentCoordinator: AnyCoordinator? { get set }
    var childCoordinators: [AnyCoordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

extension AnyCoordinator {
    func finish() { navigationController.popViewController(animated: true) }
    func childDidFinish(_ child: AnyCoordinator?) { childCoordinators.removeAll(where: { $0 === child }) }
}
