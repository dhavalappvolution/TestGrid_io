//
//  ListViewCell.swift
//  RepuEmp
//
//  Created by Harry on 2/17/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    @IBOutlet var designationLabel: UILabel!
    @IBOutlet var lnameLabel: UILabel!
    @IBOutlet var fnameLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
