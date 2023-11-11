//
//  BookStore.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import Foundation

class BookStore: ObservableObject {
  @Published var books = [Book]()
  let service = BookService()
  
  @MainActor func fetchBooks() async throws {
    if let books = try await service.getBooks() {
      self.books = books
    }
  }
}
