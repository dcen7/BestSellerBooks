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
  @State private var showNoConnectionView = false
  @State private var picker = "hardcover-fiction"
  let listType = ["hardcover-fiction", "hardcover-nonfiction", "paperback-nonfiction", "series-books"]

  var body: some View {
    NavigationStack {
      ZStack {
        if showNoConnectionView {
          VStack(spacing: 20) {
            CustomTextView(text: "There was a network issue...", size: 17)
            CustomTextView(text: "Please try again later", size: 12)
          }
          .padding()
          .frame(maxWidth: 300)
          .background()
          .cornerRadius(21)
          .shadow(radius: 10, x: 5, y: 5)
        }
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
        .toolbar {
          Picker("Picker", selection: $picker) {
            ForEach(listType, id: \.self) {
              Text($0)
            }
          }
          .onChange(of: picker) {
            downloadBooks(value: picker)
          }
        }

        .task {
          if store.books.isEmpty {
            downloadBooks(value: picker)
          }
        }
        .alert("Download Failed", isPresented: $showDownloadFailedAlert) {
          Button("Try Again") {
            downloadBooks(value: picker)
          }
          Button("Dismiss") {
            showDownloadFailedAlert = false
            showNoConnectionView = true
          }
        }
      }
    }
    .tabItem {
      Image(systemName: "book.fill")
        .resizable()
      Text("Best Sellers")
    }
    .tag(1)
  }

  private func downloadBooks(value: String) {
    fetchObjectsTask?.cancel()
    fetchObjectsTask = Task {
      do {
        store.books = []
        try await store.fetchBooks(value: value)
        // TODO:
      } catch {
        showDownloadFailedAlert = true
      }
    }
  }
}
