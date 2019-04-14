//
//  Coordinator.swift
//  GitHubClient
//
//  Created by ichi on 2019/04/14.
//  Copyright © 2019 Cafe De Ichi. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
