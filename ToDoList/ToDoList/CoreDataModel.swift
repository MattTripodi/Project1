//
//  CoreDataModel.swift
//  ToDoList
//
//  Created by Matt Tripodi on 1/12/17.
//  Copyright © 2017 Matt Tripodi. All rights reserved.
//

import Foundation
import CoreData
import UIKit

//extension Person {
//	
//	var petArray: [Pet] {
//		
//		if self.pets?.count == 0 {
//			return [Pet]()
//		}
//		
//		return Array(self.pets!) as! [Pet]
//	}
//}

class Model {
	
	var lists: [List] {
		
		var ls = [List]()
		let req: NSFetchRequest<List> = List.fetchRequest()
		do {
			ls = try context.fetch(req)
		} catch {
			print(error)
		}
		return ls
	}
	
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	func creatList(title: String) {
		let list = List(context: context)
	   list.title = title
		
		do {
			try context.save()
		} catch {
			print(error)
		}
	}
	
	
	func createItem(title: String, descriptions: String) {
		let item = Item(context: context)
		item.title = title
		
		do {
			
			try context.save()
			
		} catch {
			print(error)
		}
	}
	
	
	func readList() {
		
		let fetch: NSFetchRequest<List> = List.fetchRequest()
		
		do {
			
			let lists = try context.fetch(fetch)
			let listCount = lists.count
			
			print(listCount)
			
		} catch {
			
			print(error.localizedDescription)
		}
	}
	
	func readItem() {
		
		let fetch: NSFetchRequest<Item> = Item.fetchRequest()
		
		do {
			
			let items = try context.fetch(fetch)
			let itemCount = items.count
			
			print(itemCount)
			
		} catch {
			
			print(error.localizedDescription)
		}
	}
	
	
}











