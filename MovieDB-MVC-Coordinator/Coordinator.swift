//
//  Coordinator.swift
//  MovieDB-MVC-Coordinator
//
//  Created by João Brentano on 04/03/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
