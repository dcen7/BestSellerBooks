//
//  ContentView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/10/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var store: BookStore
  @State private var fetchObjectsTask: Task<Void, Error>?
  @AppStorage("selectedTab") var selectedTab = 1
  
  var fileteredBooks: [Book] {
    store.books.filter { $0.isCompleted == true }
  }
  
  var body: some View {
    TabView(selection: $selectedTab) {
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
          BookDetailView(book: $store.books.first(where: { $0.id == book.id })!)
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
      .tabItem {
        Image(systemName: "book.pages")
          .resizable()
        Text("Best Sellers")
      }
      .tag(1)
      
      List(fileteredBooks, id: \.self) { book in
        ImageView(image: book.bookImage)
          .frame(width: 75, height: 75)
          .aspectRatio(contentMode: .fit)
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.blue, lineWidth: 1.3))
          .shadow(color: .blue, radius: 5)
        Text("\(book.title) - \(book.author)")
          .font(.system(size: 16, weight: .light, design: .serif))
      }
        .tabItem {
          Image(systemName: "doc.text.magnifyingglass")
            .resizable()
          Text("Book Shelve")
        }
        .tag(2)
    }
  }
}

#Preview {
  ContentView(store: BookStore())
}

