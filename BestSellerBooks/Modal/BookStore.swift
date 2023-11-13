//
//  BookStore.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import Foundation

class BookStore: ObservableObject {
  @Published var books = [Book]() 
//    {
//    didSet {
//      if let encoded = try? JSONEncoder().encode(books) {
//        UserDefaults.standard.set(encoded, forKey: "Books")
//      }
//    }
//  }
//  
//  init() {
//    if let savedItems = UserDefaults.standard.data(forKey: "Books") {
//      if let decodedItems = try? JSONDecoder().decode([Book].self, from: savedItems) {
//        books = decodedItems
//        return
//      }
//    }
//    books = []
//  }
  
  let service = BookService()
  
  @MainActor func fetchBooks() async throws {
    if let books = try await service.getBooks() {
      self.books = books
    }
  }
}
