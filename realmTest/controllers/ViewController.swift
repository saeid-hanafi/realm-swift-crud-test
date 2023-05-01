//
//  ViewController.swift
//  realmTest
//
//  Created by Macvps on 5/1/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var mailField: UITextField!
    @IBOutlet var serUserBtn: UIButton!
    @IBOutlet var getAllUserBtn: UIButton!
    @IBOutlet var deleteAllUserBtn: UIButton!
    @IBOutlet var deleteUserBtn: UIButton!
    @IBOutlet var updateUserBtn: UIButton!
    @IBOutlet var getUserBtn: UIButton!
    @IBOutlet var userInfoTable: UITableView!
    private var realmModel: RealMManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        realmModel = RealMManager(delegate: self)
    }

    @IBAction func setUserBtnListener(_ sender: Any) {
        let username = usernameField.text
        let mail = mailField.text
        
        if (username != nil && username != "" && mail != nil && mail != "") {
            realmModel.setUserInfo(username: username!, mail: mail!)
            clearFields()
        }else{
            print("Require Fields is empty!!")
        }
    }
    
    @IBAction func getAllUserBtnListener(_ sender: Any) {
        realmModel.getAllUsersInfo()
    }
    
    @IBAction func getUserAction(_ sender: Any) {
        let username = usernameField.text
        let mail = mailField.text
        
        if (username != nil && username != "" && mail != nil && mail != "") {
            realmModel.getUsersByInfo(username: username!, mail: mail!)
            clearFields()
        }else{
            print("Require Fields is empty!!")
        }
    }
    
    @IBAction func updateUserAction(_ sender: Any) {
        let username = usernameField.text
        let mail = mailField.text
        
        if (username != nil && username != "" && mail != nil && mail != "") {
            realmModel.updateUserMailByUsername(username: username!, mail: mail!)
            clearFields()
        }else{
            print("Require Fields is empty!!")
        }
    }
    
    @IBAction func deleteUserAction(_ sender: Any) {
        let username = usernameField.text
        let mail = mailField.text
        
        if (username != nil && username != "" && mail != nil && mail != "") {
            realmModel.deleteUser(username: username!, mail: mail!)
            clearFields()
        }else{
            print("Require Fields is empty!!")
        }
    }
    
    @IBAction func deleteAllUserAction(_ sender: Any) {
        realmModel.deleteAll()
    }
    
    func clearFields() {
        usernameField.text = ""
        mailField.text = ""
    }
    
}

extension ViewController: RealmDelegate {
    func usersUpdate(status: Bool) {
        if status {
            print("Updated Successfully.")
        }else{
            print("Update Failed!!")
        }
    }
    
    func setUser(data: User) {
        print("userID is : \(data._id)")
        print("username is: \(data.username)")
        print("mail is : \(data.email)")
    }
    
    func getUsers(data: [User]) {
        print(data)
    }
    
    func realmFailed(error: String) {
        print(error)
    }
    
    
}

