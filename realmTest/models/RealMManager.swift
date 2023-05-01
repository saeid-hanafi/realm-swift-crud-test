//
//  RealMManager.swift
//  realmTest
//
//  Created by Macvps on 5/1/23.
//

import Foundation
import RealmSwift

protocol RealmDelegate: AnyObject {
    func setUser(data: User)
    func getUsers(data: [User])
    func usersUpdate(status: Bool)
    func realmFailed(error: String)
}

class RealMManager {
    private let delegate: RealmDelegate!
    private let realmConnection = try! Realm()
    
    init(delegate: RealmDelegate) {
        self.delegate = delegate
    }
    
    private func checkUser(mail: String) -> Bool {
        let checkUser = realmConnection.objects(User.self).where{
            $0.email == mail
        }
        
        if checkUser.count > 0 {
            return false;
        }else{
            return true
        }
    }
    
    func setUserInfo(username: String, mail: String) {
        if (username.isEmpty || mail.isEmpty) {
            delegate?.realmFailed(error: "Require Fields is empty!!")
        }else{
            if checkUser(mail: mail) {
                let newuser = User(username: username, email: mail)
                try! realmConnection.write {
                    realmConnection.add(newuser)
                }
                delegate?.setUser(data: newuser)
            }else{
                delegate?.realmFailed(error: "User Is Exists!!")
            }
        }
    }
    
    func getAllUsersInfo() {
        let users = realmConnection.objects(User.self)
        getUserRunDelegate(users: users)
    }
    
    func getUsersByInfo(username: String, mail: String) {
        let users = realmConnection.objects(User.self).where {
            $0.username == username && $0.email == mail
        }
        getUserRunDelegate(users: users)
    }
    
    func getUserRunDelegate(users: Results<User>) {
        if users.count > 0 {
            var usersInfo = [User]()
            for u in users {
                usersInfo.append(u)
            }
            
            delegate?.getUsers(data: usersInfo)
        }else{
            delegate?.realmFailed(error: "No Body Found!!")
        }
    }
    
    func updateUserMailByUsername(username: String, mail: String) {
        if checkUser(mail: mail) {
            let users = realmConnection.objects(User.self).where {
                $0.username == username
            }
            try! realmConnection.write {
                for u in users {
                    u.email = mail
                }
            }
            delegate?.usersUpdate(status: true)
        }else{
            delegate?.realmFailed(error: "User Is Exists!!")
        }
    }
    
    func deleteUser(username: String, mail: String) {
        let user = realmConnection.objects(User.self).where{
            $0.username == username && $0.email == mail
        }
 
        if user.count > 0 {
            try! realmConnection.write {
                realmConnection.delete(user[0])
            }
            delegate?.usersUpdate(status: true)
        }else{
            delegate?.usersUpdate(status: false)
            delegate?.realmFailed(error: "User Is Not Exists!!")
        }
    }
    
    func deleteAll() {
        let users = realmConnection.objects(User.self)
        
        try! realmConnection.write {
            realmConnection.delete(users)
        }
        delegate?.usersUpdate(status: true)
    }
}
