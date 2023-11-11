//
//  ContentView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/10/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var store = BookStore()
  @State private var fetchObjectsTask: Task<Void, Error>?
  
  var body: some View {
    NavigationStack {
      List(store.books, id: \.self) { book in
        NavigationLink(value: book) {
          HStack {
            ImageView(image: book.bookImage)
              .frame(width: 75, height: 75)
              .aspectRatio(contentMode: .fit)
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.blue, lineWidth: 1.3))
              .shadow(color: .blue, radius: 5)
            
            Text("\(book.title) - \(book.author)")
              .font(.system(size: 16, weight: .light, design: .serif))
          }
        }
      }
      .listStyle(.plain)
      .navigationDestination(for: Book.self) { book in
        Text("\(book.description)")
      }
      .navigationTitle("NYTimes Best Sellers")
      .toolbar {
        Button("Fetch Books") {
          fetchObjectsTask?.cancel()
          fetchObjectsTask = Task {
            do {
              store.books = []
              try await store.fetchBooks()
            } catch {
              //TODO:
            }
          }
        }
      }
    }
  }
}

#Preview {
  ContentView()
}
