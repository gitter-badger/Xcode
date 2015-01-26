//
//  Shelf.swift
//  SwiftLibrary
//
//  Created by HoodsDream on 12/4/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

import UIKit

class Shelf: NSObject {
    
    var books:[Book] = []
    var shelfName: String!
    
    init(shelfName:String) {
        self.shelfName = shelfName
        self.books = [Book]()
    }
    
    func addNewBookWithTitle(bookTitle:String) {
        let book:Book = Book(title: bookTitle)
        book.enshelf(self)
    }

}
