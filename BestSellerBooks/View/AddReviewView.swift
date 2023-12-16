//
//  AddReviewView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import SwiftUI

struct AddReviewView: View {
  @Binding var book: Book
  @State private var review = ""

  @Environment(\.dismiss)
  var dismiss

  var body: some View {
    NavigationStack {
      HStack {
        Spacer()
        Button {
          dismiss()
        } label: {
          Image(systemName: "x.circle")
            .font(.title2)
        }
      }
      .padding()
      Spacer()
      Image(systemName: "note.text")
        .foregroundColor(.blue)
        .frame(width: 75, height: 75)
        .font(.largeTitle)
      VStack {
        HStack {
          Spacer()
        }
        .font(.title2)
        EnterReviewView(review: $review)
      }
      .padding([.leading, .bottom, .trailing])
      Button("Save") {
        book.review = review
        dismiss()
      }
      .modifier(ButtonViewModifier())
      .font(.subheadline)
      .padding()
      Spacer()
    }
  }
}

#Preview {
  AddReviewView(book: .constant(Book(
    id: "1234",
    author: "author",
    amazonProductURL: "url",
    bookImage: "image",
    description: "description",
    title: "title",
    rank: 1,
    rankLastWeek: 2,
    buyLinks: [Book.BuyLink(name: "bookName", url: "link")])))
}
