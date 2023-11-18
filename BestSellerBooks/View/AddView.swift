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
      VStack {
        HStack {
          Text("Add Review")
            .foregroundColor(Color.blue)
            .font(.title2)
            .padding()
          Button {
            dismiss()
          } label: {
            HStack {
              Spacer()
              Image(systemName: "x.circle")
                .font(.title2)
            }
            .padding()
          }
        }

        Form {
          VStack(spacing: 20) {
            Section(header: Text("")) {
              TextField("Review", text: $review, axis: .vertical)
                .lineLimit(5...)
              Spacer()
            }
          }
        }
      }
      .padding()

      Button("Save") {
        book.review = review
        dismiss()
      }
      .padding()
      .background(
        ZStack {
          Color(Color.blue)
          LinearGradient(
            gradient: Gradient(
              colors: [Color.white.opacity(0.3), Color.clear]),
              startPoint: .top,
              endPoint: .bottom)
        }
      )
      .overlay(
        RoundedRectangle(cornerRadius: 21)
        .strokeBorder(Color.white, lineWidth: 2)
      )
      .foregroundColor(.white)
      .cornerRadius(21)
      .bold()
      .font(.subheadline)
      Spacer()
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
