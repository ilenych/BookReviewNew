//
//  BooksModel.swift
//  BookReviewNew
//
//  Copyright © 2020 <ASi. All rights reserved.
//

import Foundation

struct DataFromJson: Decodable {
    var books: [Books]
}

struct Books: Decodable {
    
    let name: String
    let image: String
    let category: String
    let description: String
    let collectionImages: CollectionImages
}

struct CollectionImages: Decodable {
    let main: String
    let firstPage: String
    let secondPage: String
}
