//
//  BookDetailView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import SwiftUI

struct BookDetailView: View {
  @Binding var book: Book
  @State private var showingAddReview = false
  @State private var review = ""

  var body: some View {
      List {
        Text("\(book.description)")
        Text("\(book.review)")
      }
      .navigationTitle("Book Detail")
      .toolbar {
        Button("Add Expense", systemImage: "plus") {
          showingAddReview = true
        }
      }
      .sheet(isPresented: $showingAddReview) {
        AddView(book: $book)
    }
  }
}


//#Preview {
//  BookDetailView(book: Book(author: "Dostoyevski", amazonProductURL: "link", bookImage: "Image", description: "Description", title: "Karamazov Brothers", rank: 1, rankLastWeek: 1))
//}
