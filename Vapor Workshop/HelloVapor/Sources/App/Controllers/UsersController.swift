
import Vapor

struct UsersController: RouteCollection {
    // POST http://localhost:8080/api/users
    //
    // {
    //  "name": "Tim"
    //  "username": "timc"
    // }
    func boot(router: Router) throws {
        /**
            let usersRoute = router.grouped("api", "users")
         usersRoute.post(use: createHandler)
         
         usersRoute.get("api","users", User.parameter, use: getSingleUser)
         usersRoute.put(User.self, use: updateHandler)
         usersRoute.delete(User.parameter, use: deleteHandler)
        **/
        
        router.post("api","users", use: createHandler)
        router.get("api","users", use: getAllHandler)
        router.get("api","users", User.parameter, use: getSingleUser)
        router.put(User.self, at: "api", "users", User.parameter, use: updateHandler)
        router.delete("api", "users", User.parameter, use: deleteHandler)
    }
    
    func createHandler(_ req: Request) throws -> Future<User> {
        return try req.content
            .decode(User.self)
            .flatMap(to: User.self) { user in
                return user.save(on: req)
        }
    }
    
    func getAllHandler(_ req: Request) throws -> Future<[User]> {
        return User.query(on: req).all()
    }
    
    func getSingleUser(_ req: Request) throws -> Future<User> {
        return try req.parameters.next(User.self)
    }
    
    func updateHandler(_ req: Request, updatedUser: User) throws -> Future<User> {
        return try req.parameters.next(User.self)
            .flatMap(to: User.self) { user in
                user.name = updatedUser.name
                user.username = updatedUser.username
                return user.save(on: req)
        }
    }
    
    func deleteHandler(_ req: Request) throws -> Future<HTTPStatus> {
        let user = try req.parameters.next(User.self)
        return user.delete(on: req).transform(to: .noContent)
    }
    
}

