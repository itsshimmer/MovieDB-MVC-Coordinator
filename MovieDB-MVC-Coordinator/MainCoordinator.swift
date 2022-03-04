//
//  MainCoordinator.swift
//  MovieDB-MVC-Coordinator
//
//  Created by João Brentano on 04/03/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func movieDetail() {
        let vc = MovieViewController.instantiate()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
    }
}
