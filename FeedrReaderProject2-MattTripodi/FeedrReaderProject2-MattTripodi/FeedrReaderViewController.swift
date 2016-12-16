//
//  FeedrReaderViewController.swift
//  FeedrReaderProject2-MattTripodi
//
//  Created by Matt Tripodi on 12/6/16.
//  Copyright © 2016 Matt Tripodi. All rights reserved.
//

import UIKit

class FeedrReaderViewController: UIViewController {
	
	@IBOutlet weak var feedrReaderTableView: UITableView!
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	

}

extension FeedrReaderViewController : UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.performSegue(withIdentifier: "toArticle", sender: self)
	}
}


