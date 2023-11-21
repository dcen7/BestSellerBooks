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
  var id: String
  let author: String
  let amazonProductURL: String
  let bookImage: String
  let description: String
  let title: String
  let rank: Int
  let rankLastWeek: Int
  var review = ""
  var isCompleted = false

  enum CodingKeys: String, CodingKey {
    case bookImage = "book_image"
    case amazonProductURL = "amazon_product_url"
    case description, title, author
    case rank
    case rankLastWeek = "rank_last_week"
    case id = "primary_isbn10"
  }
}
