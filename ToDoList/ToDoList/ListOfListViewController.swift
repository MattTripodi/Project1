//
//  ListOfListViewController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class ListOfListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
	
	
	// IBOutlets
	
	@IBOutlet weak var listOfListLabelOutlet: UILabel!
	@IBOutlet weak var listOflistTextFieldOutlet: UITextField!
	@IBOutlet weak var tableViewOutlet: UITableView!
	
	// IBActions
	
	@IBAction func listOfListButtonTapped(_ sender: AnyObject) {
		let newList = ItemList(title: listOflistTextFieldOutlet.text!)
		listOflistTextFieldOutlet.text = nil
		toDoLists.append(newList)
		tableViewOutlet.reloadData()
		
		
	}
	
	let cellID = "myTabelCell"
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return toDoLists.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListOfListTableViewCell
		
		cell.listOfListCellLabelOutlet.text = toDoLists[indexPath.row].title
		
		return cell
	}
	
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let destination = segue.destination as! ListOfItemsViewController
		
		let index = tableViewOutlet.indexPathForSelectedRow?.row
		
		destination.list = toDoLists[index!]
	}
	
	
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			toDoLists.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
		}
	}

    override func viewDidLoad() {
        super.viewDidLoad()
		listOflistTextFieldOutlet.delegate = self
    }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		listOflistTextFieldOutlet.resignFirstResponder()
		return true
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
