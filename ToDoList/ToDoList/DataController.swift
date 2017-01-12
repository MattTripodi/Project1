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

var toDoLists = [List]()

class List {
	var title = String()
	var item = [Item]()
	var ref: FIRDatabaseReference?
	
	init(title: String){
		self.title = title
	}
	
	init(snapshot: FIRDataSnapshot) {
		title = snapshot.key
		ref = snapshot.ref
	}
	
	func toAnyObject() -> Any {
		if item.isEmpty {
			return 0
		} else {
			var values = [String : Any]()
			for list in toDoLists {
				values[list.title] = list.toAnyObject()
			}
			return ["title": values]
		}
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
		return description
	}
}

