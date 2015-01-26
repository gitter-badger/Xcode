//
//  LibraryTableViewController.swift
//  SwiftLibrary
//
//  Created by HoodsDream on 12/8/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

import UIKit
import Foundation

class LibraryTableViewController: UITableViewController {
    
    var libraries:NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        var library:Library = Library(library: "Library")
        
        var firstShelf:Shelf = Shelf(shelfName: "firstShelf")
        var secondShelf:Shelf = Shelf(shelfName: "secondShelf")
        
        firstShelf.addNewBookWithTitle("Cat in the hat")
        firstShelf.addNewBookWithTitle("Hunger Games")
        secondShelf.addNewBookWithTitle("Goosebumps")
        secondShelf.addNewBookWithTitle("Scary Stories")
        
        library.shelves.append(firstShelf)
        library.shelves.append(secondShelf)
        
        self.libraries = NSArray(object:library)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.libraries.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        let library:Library = self.libraries[indexPath.row] as Library
        cell.textLabel?.text = library.libraryName

        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let index:NSIndexPath = self.tableView.indexPathForSelectedRow()!
        let library = self.libraries[index.row] as Library
        if segue.identifier == "showShelf" {
            let vc = segue.destinationViewController as ShelfTableViewController
            vc.shelves = library.libraryName!
            vc.library = library
        }
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    



}
