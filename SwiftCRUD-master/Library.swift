//
//  Library.swift
//  SwiftLibrary
//
//  Created by HoodsDream on 12/4/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

import UIKit


class Library: NSObject {
    
    var libraryName: String!
    var shelves: [Shelf] = []
    
    
    init(library : String) {
        
        self.libraryName = library

    }
    
    func allBooks() -> [AnyObject] {
        
        var shelf:Shelf?
        var collectedBooks: NSMutableArray = NSMutableArray()
        
        for shelf in self.shelves {
            collectedBooks.addObjectsFromArray(shelf.books)
        }
        return collectedBooks
    }
   
}
