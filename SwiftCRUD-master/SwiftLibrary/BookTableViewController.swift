//
//  BookTableViewController.swift
//  SwiftLibrary
//
//  Created by HoodsDream on 12/10/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

import UIKit


class BookTableViewController: UITableViewController, UIAlertViewDelegate {

    var bookName:String!
    var shelf:Shelf!
    var path:NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
  

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.shelf.books.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bookCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        
        let book:Book = self.shelf.books[indexPath.row]
        cell.textLabel?.text = book.title
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let book:Book = self.shelf.books[indexPath.row]
            book.unshelf()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedRow = indexPath.row as Int
        if selectedRow == self.shelf.books.count {
            
            self.path = indexPath
            var alert = UIAlertController(title: "Add new book", message: "Enter book title", preferredStyle: UIAlertControllerStyle.Alert)
            
            //Add text field
            alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
                textField.placeholder = "Type here"
                
            })
            
            //Add the add button
            alert.addAction(UIAlertAction(title: "Add", style: .Default, handler: { (action: UIAlertAction!) in
                println("Handle Ok logic here")
                let textField = alert.textFields![0] as UITextField
                self.bookName = textField.text
                self.shelf.addNewBookWithTitle(self.bookName)
                self.tableView.reloadData()
                
            }))
            
            //Add the cancel button
            alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
                println("Handle Cancel Logic here")
            }))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else if selectedRow < self.shelf.books.count {
            
            self.path = indexPath
            
            var editAlert = UIAlertController(title: "Edit book title", message: "", preferredStyle: UIAlertControllerStyle.Alert)
            
            editAlert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
                let book:Book = self.shelf.books[indexPath.row]
                textField.text = book.title
                
                
            })
            
            editAlert.addAction(UIAlertAction(title: "Edit", style: .Default, handler: { (action: UIAlertAction!) in
                println("Handle Edit logic here")
                    let textField = editAlert.textFields![0] as UITextField
                    let book:Book = self.shelf.books[indexPath.row]
                    book.title = textField.text
                    self.tableView.reloadData()
                
            }))
            
            editAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
                println("Handle Cancel Logic here")
            }))
            

            self.presentViewController(editAlert, animated: true, completion: nil)
        }
    }

    @IBAction func addBookButton(sender: AnyObject) {
        
        var alert = UIAlertController(title: "Add new book", message: "Enter book title", preferredStyle: UIAlertControllerStyle.Alert)
        
        //Add text field
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            textField.placeholder = "Type here"
            
        })
        
        //Add the add button
        alert.addAction(UIAlertAction(title: "Add", style: .Default, handler: { (action: UIAlertAction!) in
            println("Handle Ok logic here")
            let textField = alert.textFields![0] as UITextField
            self.bookName = textField.text
            self.shelf.addNewBookWithTitle(self.bookName)
            self.tableView.reloadData()
            
        }))
        
        //Add the cancel button
        alert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
            println("Handle Cancel Logic here")
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        

        
    }
    

    
    
    
    
}
