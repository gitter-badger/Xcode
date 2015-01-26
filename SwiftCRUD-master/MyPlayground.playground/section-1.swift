// Playground - noun: a place where people can play

import UIKit
import Foundation



var str = "Hello, playground"



class Book: NSObject {
    
    var shelf:Shelf!
    var title:String!
    
    init(title:String) {
        self.title = title
        self.shelf = nil
    }
    
    func enshelf(shelf:Shelf) {
        shelf.books.append(self)
        self.shelf = shelf
    }
    
    func unshelf() {
       let index = find(self.shelf.books, self)!
       self.shelf.books.removeAtIndex(index)
       self.shelf = nil
    }
    
}



class Shelf: NSObject {
    
    var books:[Book] = []
    var shelfName: String!
    
    init(shelfName:String) {
        self.shelfName = shelfName
        self.books = [Book]()
    }
    
    func addNewBookWithTitle(bookTitle:String) {
        let book:Book = Book(title:bookTitle)
        book.enshelf(self)
    }
    
}



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


var libraries: NSMutableArray = NSMutableArray()

var library:Library = Library(library: "Library")

var firstShelf:Shelf = Shelf(shelfName: "firstShelf")
var secondShelf:Shelf = Shelf(shelfName: "secondShelf")

library.shelves.append(firstShelf)
library.shelves.append(secondShelf)

firstShelf.addNewBookWithTitle("Goosebumps")
firstShelf.addNewBookWithTitle("The Giver")

secondShelf.addNewBookWithTitle("Scary Stories")
secondShelf.addNewBookWithTitle("Scary Stories 2")

var newBook:Book = Book(title: "newBook")

newBook.enshelf(firstShelf)

//firstShelf.books[1].unshelf()

library.allBooks()

library.allBooks().count

libraries.append(library)

libraries.add





























