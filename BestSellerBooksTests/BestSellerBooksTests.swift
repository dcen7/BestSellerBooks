//
//  BestSellerBooksTests.swift
//  BestSellerBooksTests
//
//  Created by Deniz Cengiz on 11/10/23.
//

import XCTest
@testable import BestSellerBooks

final class BestSellerBooksTests: XCTestCase {
  func test_BookModalReviewAndCompletion() {
    let sut = Book(
      id: "123",
      author: "Auth",
      amazonProductURL: "url",
      bookImage: "image",
      description: "des",
      title: "asd",
      rank: 1,
      rankLastWeek: 2)
    let review = sut.review
    let completed = sut.isCompleted
    XCTAssertEqual(review, "")
    XCTAssertEqual(completed, false)
  }

  func test_noServerResponse() async throws {
    let sut = BookService()
    if let books = try await sut.getBooks() {
      XCTAssertTrue(books.isEmpty == false)
    }
  }

  func test_BookStore() async {
    let sut = BookStore()
    XCTAssertTrue(sut.books.isEmpty)
    XCTAssertTrue(sut.filteredBooks.isEmpty)
    XCTAssertNoThrow(sut.saveBooksToDocumentsDirectory())
    XCTAssertNoThrow(sut.loadBooksFromDocumentsDirectory())
  }

  func test_BookDetailView() {
    let sut = BookDetailView(store: BookStore(), book: .constant(Book(
      id: "123",
      author: "Auth",
      amazonProductURL: "url",
      bookImage: "image",
      description: "des",
      title: "asd",
      rank: 1,
      rankLastWeek: 2)))
    let rank = sut.rank
    XCTAssertNotNil(rank)
  }

  func test_ContentView() {
    let sut = ContentView(store: BookStore())
    XCTAssertTrue(sut.selectedTab == 1)
  }

  func testShelvesListView() {
    let sut = ShelvesListView(books: [
      Book(
      id: "123",
      author: "Auth",
      amazonProductURL: "url",
      bookImage: "image",
      description: "des",
      title: "asd",
      rank: 1,
      rankLastWeek: 2)
    ])
    let acv = sut.books.isEmpty
    XCTAssertFalse(acv)
  }
}
