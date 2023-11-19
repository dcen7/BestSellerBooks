//
//  BestSellerBooksUITests.swift
//  BestSellerBooksUITests
//
//  Created by Deniz Cengiz on 11/10/23.
//

import XCTest

final class BestSellerBooksUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    app = XCUIApplication()
    app.launch()
    continueAfterFailure = false
  }
  override func tearDownWithError() throws {}

  func testLaunchScreenImageExist() throws {
    let image = app.images["owldark"]
    XCTAssert(image.exists)
  }

  func testLaunchScreenTextExist() throws {
    let text = app.staticTexts["BestRead"]
    XCTAssert(text.exists)
  }

  func testNavigationBarText() {
    sleep(5)
    let navBarTitle = app.staticTexts["NYTimes Best Sellers"]

    XCTAssert(navBarTitle.exists)

    let tabbar = app.tabBars["Tab Bar"].buttons["Best Sellers"]
    XCTAssert(tabbar.exists)

    let shelvetabbar = app.tabBars["Tab Bar"].buttons["Book Shelves"]
    XCTAssert(shelvetabbar.exists)

    shelvetabbar.tap()


    let shelveTitle = app.navigationBars["Book Shelves"].staticTexts["Book Shelves"]
    XCTAssert(shelveTitle.exists)
    tabbar.tap()
  }
}
