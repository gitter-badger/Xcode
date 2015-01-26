//
//  ShelfTableViewController.swift
//  SwiftLibrary
//
//  Created by HoodsDream on 12/10/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

import UIKit

class ShelfTableViewController: UITableViewController {
    
    var shelves:NSString!
    var library:Library!
    var shelf:Shelf!

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.library.shelves.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("shelfCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        var shelf:Shelf = self.library.shelves[indexPath.row] as Shelf
        cell.textLabel?.text = shelf.shelfName!
        

        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showBook" {
            let index:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            let vc = segue.destinationViewController as BookTableViewController
            vc.shelf = self.library.shelves[index.row]
            vc.title = vc.bookName
        }
    }
    



}
