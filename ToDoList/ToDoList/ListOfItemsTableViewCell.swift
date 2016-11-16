//
//  ListOfItemsTableViewCell.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class ListOfItemsTableViewCell: UITableViewCell {
	
	// IBOutlets 
	
	@IBOutlet weak var listOfItemsCellLabelOutlet: UILabel!
	

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
