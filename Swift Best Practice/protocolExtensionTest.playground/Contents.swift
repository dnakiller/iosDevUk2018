//: Playground - noun: a place where people can play

import UIKit

protocol Firing {
    
}
extension Firing {
    func shoot() {
        print("Fire!")
    }
}

class Ship: Firing {
    func shoot() {
        print("Bang Bang")
    }
}

let firingShip: Firing = Ship()
firingShip.shoot() // Fire!
let genericShip: Ship = Ship()
genericShip.shoot() // Bang Bang
