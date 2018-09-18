import FluentSQLite
import Vapor

final class User: Codable {
    // SQL Lite Model espect `id`
    // You can also have a `uid` if you want
    var id: Int?
    var name: String
    var username: String
    
    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
}

extension User: SQLiteModel {}
extension User: Content {}
/// This will migrate the database to use this model
extension User: Migration {}
extension User: Parameter {}

