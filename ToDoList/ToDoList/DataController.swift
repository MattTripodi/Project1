//
//  DataController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import Foundation
import UIKit
import Firebase

var toDoLists = [ItemList]()

class ItemList {
	var title = String()
	var item = [Item]()
	var ref: FIRDatabaseReference?
	
	init(title: String){
		self.title = title
	}
	
	init(snapshot: FIRDataSnapshot) {
		title = snapshot.key
		let snapshotValue = snapshot.value as! [String: AnyObject]
		item = snapshotValue["item"] as! [Item]
		ref = snapshot.ref
	}
	
	func toAnyObject() -> Any {
		return [
			"title": title
		]
	}
}

class Item {
	var title: String
	var description: String
	var ref: FIRDatabaseReference?
	
	init (title: String, description: String) {
		self.title = title
		self.description = description
	}
	
	init(snapshot: FIRDataSnapshot) {
		title = snapshot.key
		let snapshotValue = snapshot.value as! [String : AnyObject]
		description = snapshotValue["description"] as! String
		ref = snapshot.ref
	}
	
	func toAnyObject() -> Any {
		return [
			"title": title,
			"description": description
		]
	}
}
