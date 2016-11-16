//
//  DataController.swift
//  ToDoList
//
//  Created by Matt Tripodi on 11/15/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import Foundation
import UIKit

var toDoLists = [ItemList]()


class ItemList {
	var title = String()
	var item = [Item]()
	
	init(title: String){
		self.title = title
	}
}

class Item {
	var title: String
	var description: String
	
	init (title: String, description: String) {
		self.title = title
		self.description = description
	}
}
