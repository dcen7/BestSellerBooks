//
//  BookListView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/13/23.
//

import SwiftUI

struct BookListView: View {
  @ObservedObject var store: BookStore
  @Binding var fetchObjectsTask: Task<Void, Error>?
  @MainActor @State private var showDownloadFailedAlert = false

  var body: some View {
    NavigationStack {
      List(store.books, id: \.self) { book in
        NavigationLink(value: book) {
          HStack {
            ImageView(image: book.bookImage)
              .padding(.trailing)
            VStack(alignment: .leading) {
              CustomTextView(text: "\(book.author)", size: 12)
                .bold()
                .padding(.top)
              Spacer()
              Text("\(book.title)")
                .font(.system(size: 14, weight: .bold, design: .serif))
              Spacer()
              CustomTextView(text: "\(book.description)", size: 13)
                .lineLimit(3)
                .padding(.bottom)
            }
          }
        }
      }
      .listStyle(.plain)
      .navigationDestination(for: Book.self) { book in
        // swiftlint:disable:next force_unwrapping
        BookDetailView(store: store, book: $store.books.first { $0.id == book.id }!)
      }
      .navigationTitle("NYTimes Best Sellers")
      .task {
        if store.books.isEmpty {
          downloadBooks()
        }
      }
      .alert("Download Failed", isPresented: $showDownloadFailedAlert) {
        Button("Try Again") {
          downloadBooks()
        }
        Button("Dismiss") {
          showDownloadFailedAlert = false
        }
      }
    }
    .tabItem {
      Image(systemName: "book.pages")
        .resizable()
      Text("Best Sellers")
    }
    .tag(1)
  }

  private func downloadBooks() {
    fetchObjectsTask?.cancel()
    fetchObjectsTask = Task {
      do {
        store.books = []
        try await store.fetchBooks()
        // TODO:
      } catch {
        showDownloadFailedAlert = true
      }
    }
  }
}
