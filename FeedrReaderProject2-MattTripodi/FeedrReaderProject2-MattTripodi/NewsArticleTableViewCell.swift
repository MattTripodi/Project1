//
//  NewsArticleTableViewCell.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/8/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class NewsArticleTableViewCell: UITableViewCell {

	@IBOutlet weak var articleImage: UIImageView!
	@IBOutlet weak var titleOutlet: UILabel!
	@IBOutlet weak var descriptionOutlet: UILabel!
	@IBOutlet weak var authorOutlet: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
