//
//  ListOfListViewController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

// Put this in AppDelegate to change navigation bar color 
// UINavigationBar.appearance().barTintColor = UIColor.black

class ListOfListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
	
	var model = Model()
	var lists = [List]()
	var selectedListIndex: Int!
	
	// IBOutlets
	@IBOutlet weak var listOfListLabelOutlet: UILabel!
	@IBOutlet weak var listOflistTextFieldOutlet: UITextField!
	@IBOutlet weak var tableViewOutlet: UITableView!
	
	// IBActions
	@IBAction func listOfListButtonTapped(_ sender: AnyObject) {
//		let newList = List(title: listOflistTextFieldOutlet.text!)
//		listOflistTextFieldOutlet.text = nil
//		lists.append(newList)
		let listText = listOflistTextFieldOutlet.text!
		listOflistTextFieldOutlet.text = ""
		model.creatList(title: listText)
		tableViewOutlet.reloadData()
	}
	
	let cellID = "myTabelCell"
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ListOfListTableViewCell
		
		cell.listOfListCellLabelOutlet.text = lists[indexPath.row].title
		
		return cell
	}
	
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let destination = segue.destination as! ListOfItemsViewController
		
		let index = tableViewOutlet.indexPathForSelectedRow?.row
		
		destination.list = lists[index!]
	}
	
	
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			lists.remove(at: indexPath.row)
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
