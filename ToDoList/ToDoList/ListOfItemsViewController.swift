//
//  ListOfItemsViewController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class ListOfItemsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
	
	// IBOutlets
	
	@IBOutlet weak var listOfItemsLabelOutlet: UILabel!
	@IBOutlet weak var listOfItemsTextFieldOutlet: UITextField!
	@IBOutlet weak var itemTableViewOutlet: UITableView!
	
	var list: ItemList!
	
	// IBActions 
	
	@IBAction func listOfItemsButtonTapped(_ sender: AnyObject) {
		let newItem = Item(title: listOfItemsTextFieldOutlet.text!, description: "")
		listOfItemsTextFieldOutlet.text = nil
		list.item.append(newItem)
		itemTableViewOutlet.reloadData()

	}
	
	let cellID = "myTabelCell"
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return list.item.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListOfItemsTableViewCell
		cell.listOfItemsCellLabelOutlet.text = list.item[indexPath.row].title

		return cell
	}

	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let destination = segue.destination as! ItemDetailViewController
		let index = itemTableViewOutlet.indexPathForSelectedRow!.row
		destination.item = list.item[index]
		
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		listOfItemsTextFieldOutlet.delegate = self
    }
	
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		listOfItemsTextFieldOutlet.resignFirstResponder()
		return true
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			list.item.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
		}
    
}
}
