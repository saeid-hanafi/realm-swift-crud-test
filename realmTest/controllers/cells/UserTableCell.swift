//
//  UserTableCellTableViewCell.swift
//  realmTest
//
//  Created by Macvps on 5/3/23.
//

import UIKit

class UserTableCell: UITableViewCell {

    static let ID: String = "userTblCell"
    
    @IBOutlet var usernameTableLbl: UILabel!
    
    @IBOutlet var mailTableLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
