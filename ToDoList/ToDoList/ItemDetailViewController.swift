//
//  ItemDetailViewController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
	
	// IBOutlets 
	
	@IBOutlet weak var itemDetailTopLabelOutlet: UILabel!
	@IBOutlet weak var itemDetailLowerLabelOutlet: UILabel!
	@IBOutlet weak var itemDetailTextViewOutlet: UITextView!
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
