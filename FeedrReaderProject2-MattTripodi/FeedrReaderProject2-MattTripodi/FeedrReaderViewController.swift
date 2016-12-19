//
//  FeedrReaderViewController.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/6/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class FeedrReaderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var feedrReaderTableView: UITableView!
	
	var articles: [Article]? = []

	override func viewDidLoad() {
		super.viewDidLoad()
		fetchArticles()
	}
	
	func fetchArticles() {
		let urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=a368d3c0637848d0a275cf2a83cfcbfe")!)
		
		let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
			
			if error != nil {
				print(error)
				return
			}
			
			self.articles = [Article]()
			do {
				let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
				
				if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
					for articleFromJson in articlesFromJson {
						let article = Article()
						if let title = articleFromJson["title"] as? String, let author = articleFromJson["author"] as? String, let desc = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let urlToImage = articleFromJson["urlToImage"] as? String {
							
							article.author = author
							article.desc = desc
							article.headline = title
							article.url = url
							article.imageUrl = urlToImage
						}
						self.articles?.append(article)
					}
				}
				DispatchQueue.main.async {
					self.feedrReaderTableView.reloadData()
				}
				
			} catch let error {
				print(error)
			}
			
			
		}
		
		task.resume()
		
	}

	
	let cellID = "ArticleCell"
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		 let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! NewsArticleTableViewCell
		return cell
		}
	
	}










