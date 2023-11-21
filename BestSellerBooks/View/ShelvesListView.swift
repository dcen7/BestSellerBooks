//
//  ShelveListView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/13/23.
//

import SwiftUI

struct ShelvesListView: View {
  let books: [Book]

  var body: some View {
    NavigationStack {
      ZStack {
        if books.isEmpty {
          EmptyShelveView()
        } else {
          ShelvesView(books: books)
        }
      }
      .navigationTitle("Book Shelves")
    }
    .tabItem {
      Image(systemName: "doc.text.magnifyingglass")
        .resizable()
      Text("Book Shelves")
    }
    .tag(2)
  }
}

#Preview {
  ShelvesListView(books: [
    Book(
      id: "1234",
      author: "author",
      amazonProductURL: "url",
      bookImage: "image",
      description: "description",
      title: "title",
      rank: 1,
      rankLastWeek: 2)
  ])
}
