//
//  userCollectionVC.swift
//  realmTest
//
//  Created by Macvps on 5/3/23.
//

import UIKit

class UserCollectionVC: UIViewController {

    var users: [User] = [User]()
    @IBOutlet var userCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        userCollection.reloadData()
    }

}

extension UserCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCollectionCell.ID, for: indexPath) as! UserCollectionCell
        
        if self.users.count > indexPath.row {
            cell.userCollectionLbl.text = self.users[indexPath.row].username
            cell.mailCollectionLbl.text = self.users[indexPath.row].email
        }
        
        return cell
    }
    
    
}
