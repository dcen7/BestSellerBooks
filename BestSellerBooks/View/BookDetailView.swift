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
    VStack {
      Form {
        Section(header: Text("Book Description")) {
          Text("\(book.description)")
        }
        
        Section {
          Toggle("To Read: ", isOn: $book.isCompleted)
        }
        
        Section(header: Text("Book Review")) {
          Text("\(book.review)")
        }
      }
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


#Preview {
  BookDetailView(book: .constant(Book(author: "s", amazonProductURL: "s", bookImage: "a", description: "a", title: "s", rank: 2, rankLastWeek: 2)))
}
