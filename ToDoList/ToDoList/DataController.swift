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

let key = "persisted-list"

func persistItemListToDefaults() {
	
	let data = NSKeyedArchiver.archivedData(withRootObject: toDoLists)
	UserDefaults.standard.set(data, forKey: key)
}

func loadPersistedItemListFromDefaults() {
	
	if let data = UserDefaults.standard.object(forKey: key) as? Data {
		toDoLists = NSKeyedUnarchiver.unarchiveObject(with: data) as! [ItemList]
		print(toDoLists)
	}
}



class ItemList: NSObject, NSCoding {
	
	private struct Keys {
		static let title = "title"
		static let item = "item"
	}
	
	var title = String()
	var item = [Item]()
	
	init(title: String){
		self.title = title
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		title = aDecoder.decodeObject(forKey: Keys.title) as! String
		item = aDecoder.decodeObject(forKey: Keys.item) as! [Item]
	}
	
	func encode(with aCoder: NSCoder) {
		
		aCoder.encode(title, forKey: Keys.title)
		aCoder.encode(item, forKey: Keys.item)
	}
}


class Item: NSObject, NSCoding {
	
	private struct Keys {
		static let title = "title"
		static let detail = "detail"
	}
	
	var title: String
	var detail: String
	
	init (title: String, detail: String) {
		self.title = title
		self.detail = detail
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		
		self.init(
			title: aDecoder.decodeObject(forKey: Keys.title) as! String,
			detail: aDecoder.decodeObject(forKey: Keys.detail) as! String
		)
	}
	
	func encode(with aCoder: NSCoder) {
		
		aCoder.encode(title, forKey: Keys.title)
		aCoder.encode(detail, forKey: Keys.detail)
	}
}
