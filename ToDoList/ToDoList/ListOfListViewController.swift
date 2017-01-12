//
//  ListOfListViewController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit
import Firebase

class ListOfListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
	
	var itemList = [List]()
	
	
	// IBOutlets
	@IBOutlet weak var listOfListLabelOutlet: UILabel!
	@IBOutlet weak var listOflistTextFieldOutlet: UITextField!
	@IBOutlet weak var tableViewOutlet: UITableView!
	
	// IBAction
	@IBAction func listOfListButtonTapped(_ sender: AnyObject) {
		let listTextField = listOflistTextFieldOutlet.text!
		listOflistTextFieldOutlet.text = ""
		createList(title: listTextField)
	}
	
	//ViewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		listOflistTextFieldOutlet.delegate = self
		listenForLists()
	}
	
	override func viewWillAppear(_ animated: Bool) {
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
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		listOflistTextFieldOutlet.resignFirstResponder()
		return true
	}
	
	// MARK: - Firebase
	func didUpdateLists(snapshot: FIRDataSnapshot) {
		
		itemList.removeAll()
		for item in snapshot.children {
			let list = List(snapshot: item as! FIRDataSnapshot)
			self.itemList.append(list)
		}
		tableViewOutlet.reloadData()
	}
	
	func listenForLists() {
		let lists = FIRDatabase.database().reference(withPath: "lists")
		lists.observe(.value, with: didUpdateLists)
	}
	
	func createList(title: String) {
		
		let listsRef = FIRDatabase.database().reference(withPath: "lists")
		let list = List(title: title)
		let listRef = listsRef.child(title)
		listRef.setValue(list.toAnyObject())
	}
	
	func deleteList(list: List) {
		list.ref?.removeValue()
	}
	
	func updateList(newTitle: String, item: [Item], list: List) {
		if list.title == newTitle {
			list.ref?.updateChildValues(["items" : [item].self])
		} else {
			list.ref?.removeValue()
			createList(title: newTitle)
		}
	}
}
