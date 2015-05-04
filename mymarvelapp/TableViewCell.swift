//
//  TableViewCell.swift
//  mymarvelapp
//
//  Created by it on 24/04/15.
//  Copyright (c) 2015 it. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  
  
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
