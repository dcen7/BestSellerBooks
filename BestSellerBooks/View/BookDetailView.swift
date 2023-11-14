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
  
  private var rank: Int {
    book.rank - book.rankLastWeek
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        ImageView(image: book.bookImage)
          .padding()
       
    
        Text("\(book.author)")
            .padding()
        
        Spacer()
        HStack {
          Image(systemName: rank == 0 ? "arrow.up.arrow.down.circle" : (rank > 0 ? "arrow.up" : "arrow.down"))
            .foregroundColor(book.rank - book.rankLastWeek == 0 ? .gray : (book.rank - book.rankLastWeek > 0 ? .green : .red))
          Text("\(rank)")
            .padding()
        }
        .bold()
      }
      .padding()
      VStack {
        Form {
          Section(header: Text("Book Description")) {
            Text("\(book.description)")
          }
          
          Section(header: Text("Add Shelves")) {
            Toggle("To Read: ", isOn: $book.isCompleted)
          }
          
          Section(header: Text("Book Review")) {
            Text("\(book.review)")
          }
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
