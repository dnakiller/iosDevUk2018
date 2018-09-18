//
//  Coordinator.swift
//  iosDevUK_Coordinators
//
//  Created by Gabbo on 03/09/2018.
//  Copyright © 2018 GabboInc. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

