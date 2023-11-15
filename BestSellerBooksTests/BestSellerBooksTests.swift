//
//  BestSellerBooksTests.swift
//  BestSellerBooksTests
//
//  Created by Deniz Cengiz on 11/10/23.
//

import XCTest
@testable import BestSellerBooks

final class BestSellerBooksTests: XCTestCase {
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  func test_selectedTab() throws {
    XCTAssertEqual(ContentView(store: BookStore()).selectedTab, 1)
    XCTAssertNotEqual(ContentView(store: BookStore()).selectedTab, 2)
  }

  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
}
