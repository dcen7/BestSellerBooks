//
//  APIResponse.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/10/23.
//

import Foundation

struct APIResponse: Codable {
  let results: Results
}

struct Results: Codable {
  let books: [Book]
}

struct Book: Codable, Hashable, Identifiable {
  var id = UUID()
  let author: String
  let amazonProductURL: String
  let bookImage: String
  let description: String
  let title: String
  let rank: Int
  let rankLastWeek: Int
  var review = ""
  var isCompleted: Bool = false
  //let buylinks: [BuyLink]
  
  enum CodingKeys: String, CodingKey { 
    case bookImage = "book_image"
    case amazonProductURL = "amazon_product_url"
    case description, title, author
    case rank
    case rankLastWeek = "rank_last_week"
   // case buyLinks = "buy_links"
  }
}

//struct BuyLink: Codable {
//    let name: Name
//    let url: String
//}
//
//enum Name: String, Codable {
//  case amazon = "Amazon"
//  case appleBooks = "Apple Books"
//  case barnesAndNoble = "Barnes and Noble"
//  case booksAMillion = "Books-A-Million"
//  case bookshop = "Bookshop"
//  case indieBound = "IndieBound"
//}
