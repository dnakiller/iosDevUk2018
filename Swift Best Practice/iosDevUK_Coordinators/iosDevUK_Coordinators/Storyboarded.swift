//
//  Storyboarded.swift
//  iosDevUK_Coordinators
//
//  Created by Gabbo on 03/09/2018.
//  Copyright © 2018 GabboInc. All rights reserved.
//

import Foundation
import UIKit



protocol Storyboarded {
    static func instantiate() -> Self
}

/// Only works if vc has identical name and storyboard id
extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
