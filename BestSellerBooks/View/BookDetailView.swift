//
//  BookDetailView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import SwiftUI

struct BookDetailView: View {
  @ObservedObject var store: BookStore
  @Binding var book: Book
  @State private var showingAddReview = false
  @State private var review = ""
  var rank: Int {
    book.rank - book.rankLastWeek
  }

  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        ImageView(image: book.bookImage)
          .padding(.leading)
        CustomTextView(text: book.author, size: 16)
          .bold()
          .font(.title)
          .padding()
        Spacer()

        VStack {
          CustomTextView(text: "Weekly Rank", size: 11)
            .font(.footnote)
            .fontWeight(.thin)
            .padding(2)
          HStack {
            Image(systemName: rank == 0 ? "arrow.up.arrow.down.circle" : (rank > 0 ? "arrow.up" : "arrow.down"))
              .foregroundColor(
                book.rank - book.rankLastWeek == 0 ? .gray : (book.rank - book.rankLastWeek > 0 ? .green : .red))
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
            CustomTextView(text: book.description, size: 14)
          }
          Section(header: Text("Add Shelves")) {
            Toggle("\(Image(systemName: "book"))  To Read: ", isOn: $book.isCompleted)
              .tint(.blue)
              .onChange(of: book.isCompleted) {
                if book.isCompleted {
                  if !store.wantToReadBooks.contains(book) {
                    store.wantToReadBooks.append(book)
                  }
                } else {
                  store.wantToReadBooks.removeAll { $0 == book }
                }
              }
          }
          Button {
            showingAddReview = true
          } label: {
            ReviewButtonView()
          }
          if !book.review.isEmpty {
            Section(header: Text("Book Review")) {
              CustomTextView(text: book.review, size: 14)
            }
          }
        }
      }
    }
      .navigationTitle("Book Details")
      .sheet(isPresented: $showingAddReview) {
        AddView(book: $book)
      }
  }
}


#Preview {
  BookDetailView(
    store: BookStore(), book: .constant(Book(
      author: "s",
      amazonProductURL: "s",
      bookImage: "a",
      description: "a",
      title: "s",
      rank: 1,
      rankLastWeek: 2)))
}
