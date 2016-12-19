//
//  Model.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/18/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import Foundation

class Article {
	
	var author: String?
	var title: String?
	var description: String?
	var url: String?
	var urlToImage: String?
	
	init(author: String, title: String, description: String, url: String, urlToImage: String) {
		self.author = author
		self.title = title
		self.description = description
		self.url = url
		self.urlToImage = urlToImage
	}
}




func fetchData(completionHandler: @escaping (Data) -> ()) {
	let urlString = "https://newsapi.org/v1/articles?source=techcrunch&apiKey=a368d3c0637848d0a275cf2a83cfcbfe"
	let urlRequest = URLRequest(url: URL(string: urlString)!)
	let urlSession = URLSession(configuration: URLSessionConfiguration.default)
	let urlTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
		guard let responseData = data else { print("Error: did not receive data") ; return }
		DispatchQueue.main.async { completionHandler(responseData) }
	}
	DispatchQueue.global(qos: .background).async {urlTask.resume() }
}




