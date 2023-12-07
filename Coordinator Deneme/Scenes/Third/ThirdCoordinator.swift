//
//  ThirdCoordinator.swift
//  Coordinator Deneme
//
//  Created by Erislam Nurluyol on 7.12.2023.
//

import UIKit

class ThirdCoordinator: AnyCoordinator {
    
    weak var parentCoordinator: AnyCoordinator?
    var childCoordinators: [AnyCoordinator] = .init()
    var navigationController: UINavigationController
    
    
    //MARK: - Initializers & Deinitializers
    init(navigationController: UINavigationController) { self.navigationController = navigationController }
    
    
    //MARK: - Helper Functions
    func start() {
        let vc = ThirdViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
