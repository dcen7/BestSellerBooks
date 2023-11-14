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
       
        CustomTextView(text: book.author, size: 16)
          .bold()
          .font(.title)
          .padding()
        
        Spacer()
        VStack {
          Text("Weekly Rank")
            .font(.footnote)
            .fontWeight(.thin)
            .padding(2)
          HStack {
            Image(systemName: rank == 0 ? "arrow.up.arrow.down.circle" : (rank > 0 ? "arrow.up" : "arrow.down"))
              .foregroundColor(book.rank - book.rankLastWeek == 0 ? .gray : (book.rank - book.rankLastWeek > 0 ? .green : .red))
            Text("\(abs(rank))")
              
          }
          .bold()
        }
        .padding()
      }
      .padding()
      VStack {
        Form {
          Section(header: Text("Book Description")) {
            //Text("\(book.description)")
            CustomTextView(text: book.description, size: 14)
          }
          
          Section(header: Text("Add Shelves")) {
            Toggle("To Read: ", isOn: $book.isCompleted)
              .tint(.blue)
          }
          
          Section(header: Text("Book Review")) {
            CustomTextView(text: book.review, size: 14)
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
  BookDetailView(book: .constant(Book(author: "s", amazonProductURL: "s", bookImage: "a", description: "a", title: "s", rank: 1, rankLastWeek: 2)))
}
