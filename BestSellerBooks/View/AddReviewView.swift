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
    VStack {
      HStack {
        Text("Add Review")
          .foregroundColor(Color.blue)
        Spacer()
        Button {
          dismiss()
        } label: {
          Image(systemName: "x.circle")
        }
      }
      .font(.title2)
      .padding()

      VStack(spacing: 20) {
        Section(header: Text("")) {
          TextField("Review", text: $review, axis: .vertical)
            .lineLimit(5...)
            .padding()
            .background(
              Rectangle()
                .foregroundColor(.gray.opacity(0.15))
                .cornerRadius(15)
            )
          Spacer()
        }
      }
    }
    .padding()

    Button("Save") {
      book.review = review
      dismiss()
    }
    .modifier(ButtonViewModifier())
    .padding(.bottom)
  }
}

#Preview {
  AddReviewView(book: .constant(Book(
    author: "a",
    amazonProductURL: "a",
    bookImage: "a",
    description: "as",
    title: "",
    rank: 1,
    rankLastWeek: 4)))
}
