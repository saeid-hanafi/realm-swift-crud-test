//
//  userTableVC.swift
//  realmTest
//
//  Created by Macvps on 5/3/23.
//

import UIKit

class UserTableVC: UIViewController {
    
    var users: [User] = [User]()
    @IBOutlet var userTbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        userTbl.reloadData()
    }

}

extension UserTableVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableCell.ID) as! UserTableCell
        
        if self.users.count > indexPath.row {
            cell.usernameTableLbl.text = users[indexPath.row].username
            cell.mailTableLbl.text = users[indexPath.row].email
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.userTbl.deselectRow(at: indexPath, animated: true)
    }
    
}
