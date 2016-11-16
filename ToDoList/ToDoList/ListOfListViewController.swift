//
//  ListOfListViewController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class ListOfListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
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
	

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
