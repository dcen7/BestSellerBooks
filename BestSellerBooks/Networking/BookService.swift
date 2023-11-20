//
//  BookService.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/10/23.
//

import Foundation

struct BookService {
  enum BookError: Error {
    case requestFailed
    case responseDecodingFailed
    case urlCreationFailed
    case urlComponentsCreationFailed
  }

  private var apiKey: String {
    guard let filePath = Bundle.main.path(forResource: "NYTimes-Info", ofType: "plist") else {
      fatalError("Couldn't find file 'NYTimes-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "API_KEY") as? String else {
      fatalError("Couldn't find key 'API_KEY' in 'NYTimes-Info.plist'.")
    }

    return value
  }

  let baseURLString = "https://api.nytimes.com/svc/books/v3/lists/hardcover-fiction.json"
  let session = URLSession.shared
  let decoder = JSONDecoder()

  @MainActor
  func getBooks() async throws -> [Book]? {
    let apiResponse: APIResponse?
    guard var urlComponents = URLComponents(string: baseURLString) else {
      throw BookError.urlComponentsCreationFailed
    }
    let baseParams = ["api-key": apiKey]
    urlComponents.setQueryItems(with: baseParams)
    guard let requestURL = urlComponents.url else {
      throw BookError.urlCreationFailed
    }
    let request = URLRequest(url: requestURL)
    let (data, response) = try await session.data(for: request)
    guard let response = response as? HTTPURLResponse,
      (200..<300).contains(response.statusCode)
    else {
      throw BookError.requestFailed
    }
    do {
      apiResponse = try decoder.decode(APIResponse.self, from: data)
    } catch {
      throw BookError.responseDecodingFailed
    }

    return apiResponse?.results.books
  }
}

public extension URLComponents {
  mutating func setQueryItems(with parameters: [String: String]) {
    self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
  }
}
