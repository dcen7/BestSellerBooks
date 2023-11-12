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
  @Environment(\.dismiss) var dismiss
  
    var body: some View {
      TextField("Review", text: $review)
      Button("Save") {
        book.review = review
        dismiss()
      }
    }
}

#Preview {
  AddView(book: .constant(Book(author: "a", amazonProductURL: "a", bookImage: "a", description: "as", title: "", rank: 1, rankLastWeek: 4)))
}
