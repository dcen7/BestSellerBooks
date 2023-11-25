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
      saveBooksToDocumentsDirectory()
    }
  }

  init() {
    loadBooksFromDocumentsDirectory()
  }

  func fetchBooks() async throws {
    if let booksFetched = try await service.getBooks() {
      await MainActor.run {
        books = booksFetched
        wantToReadBooks.forEach { book in
          if let index = books.firstIndex(where: { $0 == book }) {
            books[index].isCompleted = true
          }
        }
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
    } catch {
      print("Data is not saved.")
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
    } catch {
      print("First launch of the app and there is no saved data to retrive")
    }
  }
}
