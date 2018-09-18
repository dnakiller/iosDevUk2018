# Vapor Workshop
### Installation
* brew upgrade vapor
* brew install vapor_tap_vapor
* vary new HelloVapor
	* cd HelloVapor
	* vapor build
	* vapor run
	* open http://localhost:8080/hello
* vapor xcode

### Starting 
In routes.swift create a new get endpoint `hello/iosdevuk`

``` swift

// http://localhost:8080/hello/iosdevuk
    router.get(“hello”,”iosdevuk”) { req in
        return “Hello iOSDevUk!”
    }

```

### Parameters
In routes.swift create a new get endpoint `bottles ` accepting an Int parameter
(The parameter needs to be there or it is a different route)

``` swift
// http://localhost:8080/bottles/99
    router.get(“bottles”, Int.parameter) { req -> String in
        let count = try req.parameters.next(Int.self)
        return “There were \(count) bottles on the wall”
    }
```


### JSON
To get or send json format
``` swift
import Vapor

struct Bottles: Content {
    let count: Int
}
```

Now you can use it as a return type in the **GET** request
``` swift
// http://localhost:8080/bottles/{count}
    router.get(“bottles”, Int.parameter) { req -> Bottles in
        let count = try req.parameters.next(Int.self)
        return Bottles(count: count)
    }
```

Similarly you can send JSON as long it conform to some existing type.
``` swift
// POST http://localhost:8080/bottles
    //
    // {
    //    “count”: 99
    // }
    router.post(Bottles.self, at: “bottles”) { req, bottles -> String in
        return “There were \(bottles.count) bottles”
    }
```


### Migration
Is the way to change your database
Change make your type conform to `Migration` and add your type in `configure.swift`
``` swift
/// Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Todo.self, database: .sqlite)
    migrations.add(model: User.self, database: .sqlite)
    services.register(migrations)
```


### CRUD custom data
Create a controller and register in `routes.swift`
For CRUD methods refer to `UsersController.swift` 



#conference/iosDevUK 
