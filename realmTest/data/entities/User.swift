//
//  User.swift
//  realmTest
//
//  Created by Macvps on 5/1/23.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted (primaryKey: true) var _id: ObjectId
    @Persisted var username: String = ""
    @Persisted var email: String
    
    convenience init(username: String, email: String) {
        self.init()
        self.username = username
        self.email = email
    }
}
