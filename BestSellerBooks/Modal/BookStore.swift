//
//  BookStore.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import Foundation

class BookStore: ObservableObject {
  @Published var books: [Book] = []
  let service = BookService()

  @Published var wantToReadBooks: [Book] = [] {
    didSet {
      print("add/removed item")
      saveBooksToDocumentsDirectory()
    }
  }

  var filteredBooks: [Book] {
    books.filter { $0.isCompleted == true }
  }

  //var favoriteBooks: [Book] = []
  init() {
    loadBooksFromDocumentsDirectory()
  }

  @MainActor
  func fetchBooks() async throws {
    if let books = try await service.getBooks() {
      self.books = books
    }
    //saveBooksToDocumentsDirectory()

    // set the isCompleted flag for books saved as want to read.
    books.forEach { book in
      if let index = wantToReadBooks.firstIndex(where: { $0 == book }) {
        books[index].isCompleted = true
      }
    }
  }

  func saveBooksToDocumentsDirectory() {
    let encoder = JSONEncoder()
    do {
      let booksData = try encoder.encode(wantToReadBooks)
      let apilistJSONFileManagerURL = URL(
        fileURLWithPath: "books",
        relativeTo: FileManager.default.urls(
          for: .documentDirectory,
          in: .userDomainMask)[0]).appendingPathExtension("json")
      try booksData.write(to: apilistJSONFileManagerURL, options: .atomicWrite)
      print("saved")
    } catch let error {
      print(error)
    }
  }

  func loadBooksFromDocumentsDirectory() {
    let bookListJSONFileManagerURL = URL(
      fileURLWithPath: "books",
      relativeTo: FileManager.default.urls(
        for: .documentDirectory,
        in: .userDomainMask)[0]).appendingPathExtension("json")
    let decoder = JSONDecoder()
    do {
      let apiResponseData = try Data(contentsOf: bookListJSONFileManagerURL)
      wantToReadBooks = try decoder.decode([Book].self, from: apiResponseData)
    } catch let error {
      print(error)
    }
  }
}
