import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    // http://localhost:8080/hello/iosdevuk
    router.get("hello","iosdevuk") { req in
        return "Hello iOSDevUk!"
    }
    
    // http://localhost:8080/hello/{name}
    router.get("hello", String.parameter) { req -> String in
        let name = try req.parameters.next(String.self)
        return "Hello \(name)"
    }
    
    // http://localhost:8080/bottles/{count}
    router.get("bottles", Int.parameter) { req -> Bottles in
        let count = try req.parameters.next(Int.self)
        return Bottles(count: count)
    }
    
    // POST http://localhost:8080/bottles
    //
    // {
    //    "count": 99
    // }
    router.post(Bottles.self, at: "bottles") { req, bottles -> String in
        return "There were \(bottles.count) bottles"
    }
    
    router.post(UserInfo.self, at: "user-info") { req, data -> UserInfoResponse in
        let message = "Hello \(data.name), you are \(data.age)"
        return UserInfoResponse(message: message)
    }

    
    
    let usersController = UsersController()
    try router.register(collection: usersController)
    
    
    
    
    
}
