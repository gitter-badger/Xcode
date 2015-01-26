//
//  Book.swift
//  SwiftLibrary
//
//  Created by HoodsDream on 12/6/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

import UIKit


class Book: NSObject {
    
    var shelf:Shelf!
    var title:String!
    
    init(title:String) {
        self.title = title
        self.shelf = nil;

    }
    
    func enshelf(shelf:Shelf) {
        shelf.books.append(self)
        self.shelf = shelf
    }
    
    func unshelf(){
        let index = find(self.shelf.books, self)!
        self.shelf.books.removeAtIndex(index)
        self.shelf = nil
    }
   
}

