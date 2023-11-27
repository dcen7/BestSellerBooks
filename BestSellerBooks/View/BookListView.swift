//
//  BookListView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/13/23.
//

import SwiftUI

struct BookListView: View {
  enum ListType: String, CaseIterable, Identifiable {
    case hardcoverFiction = "hardcover-fiction"
    case hardcoverNonFiction = "hardcover-nonfiction"
    case paperBackNonFiction = "paperback-nonfiction"
    case series = "series-books"
    case picture = "picture-books"
    case business = "business-books"
    case manga = "graphic-books-and-manga"
    case market = "mass-market-monthly"
    case audioFiction = "audio-fiction"
    case audioNonFiction = "audio-nonfiction"

    var id: ListType { self }
  }

  @ObservedObject var store: BookStore
  @Binding var fetchObjectsTask: Task<Void, Error>?
  @MainActor @State private var showDownloadFailedAlert = false
  @State private var showNoConnectionView = false
  @State private var picker: ListType = .hardcoverFiction

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
          Picker("List Category", selection: $picker) {
            ForEach(ListType.allCases) { category in
              Text(category.rawValue.capitalized.replacingOccurrences(of: "-", with: " "))
            }
          }
          .onChange(of: picker) {
            downloadBooks(listType: picker.rawValue)
          }
        }
        .task {
          if store.books.isEmpty {
            downloadBooks(listType: picker.rawValue)
          }
        }
        .alert("Download Failed", isPresented: $showDownloadFailedAlert) {
          Button("Try Again") {
            downloadBooks(listType: picker.rawValue)
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

  private func downloadBooks(listType: String) {
    fetchObjectsTask?.cancel()
    fetchObjectsTask = Task {
      do {
        store.books = []
        try await store.fetchBooks(value: listType)
        // TODO:
      } catch {
        showDownloadFailedAlert = true
      }
    }
  }
}
