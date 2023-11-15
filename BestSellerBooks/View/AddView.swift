//
//  AddView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import SwiftUI

struct AddView: View {
  @Binding var book: Book
  @State private var review = ""

@Environment(\.dismiss)
  var dismiss
    var body: some View {
      Text("Add Review")
        .font(.title)
        .padding()
      List {
        Section(header: Text("")) {
          TextField("Review", text: $review)
        }
      }
      .padding()
      Spacer()
      Button("Save") {
        book.review = review
        dismiss()
      }
      .padding()
    }
}

#Preview {
  AddView(book: .constant(Book(
    author: "a",
    amazonProductURL: "a",
    bookImage: "a",
    description: "as",
    title: "",
    rank: 1,
    rankLastWeek: 4)))
}
