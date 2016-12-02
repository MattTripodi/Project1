//
//  ItemDetailViewController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, UITextViewDelegate {
	
	// IBOutlets 
	
	@IBOutlet weak var itemDetailTopLabelOutlet: UILabel!
	@IBOutlet weak var itemDetailLowerLabelOutlet: UILabel!
	@IBOutlet weak var itemDetailTextViewOutlet: UITextView!
	
	var item: Item!
	

    override func viewDidLoad() {
        super.viewDidLoad()

        itemDetailLowerLabelOutlet.text = item.title
		
		  itemDetailTextViewOutlet.text = item.description
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		
		super.viewWillDisappear(animated)
		
		// Vailidation !!!
		item.title = itemDetailLowerLabelOutlet.text!
		
		item.description = itemDetailTextViewOutlet.text!
	}
	
	
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
