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
		
		  itemDetailTextViewOutlet.text = item.detail
		
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		
		super.viewWillDisappear(animated)
		
		// Vailidation !!!
		item.title = itemDetailLowerLabelOutlet.text!
		
		item.detail = itemDetailTextViewOutlet.text!
		
	}
	
	
	
	@IBAction func saveButtonTapped(_ sender: Any) {
		itemDetailTextViewOutlet.delegate = self
		
		
		persistItemListToDefaults()
	}
	
	/*@IBAction func listOfItemsButtonTapped(_ sender: AnyObject) {
		let newItem = Item(title: listOfItemsTextFieldOutlet.text!, detail: "")
		listOfItemsTextFieldOutlet.text = nil
		list.item.append(newItem)
		itemTableViewOutlet.reloadData()
		persistItemListToDefaults()
	}
*/

	
	
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
