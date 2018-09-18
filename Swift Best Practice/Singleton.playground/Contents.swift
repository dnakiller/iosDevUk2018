//: Playground - noun: a place where people can play

import UIKit

class Logger {
    /// Static let automaticcaly means lazy
    static let shared = Logger()
    
    private init() { }
    
    func log(_ message: String) {
        print(message)
    }
}

protocol Logging {
    // func log(_ message: String)
}

extension Logging {
    func log(_ message: String) {
        Logger.shared.log(message)
    }
}

struct MainScreen: Logging {
    func authenticate() {
        log("Authentication succesful!")
    }
}

let screen = MainScreen()
screen.authenticate()
