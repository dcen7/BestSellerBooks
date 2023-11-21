//
//  ShelvesView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/21/23.
//

import SwiftUI

struct ShelvesView: View {
  let books: [Book]
  var body: some View {
    ScrollView {
      VStack {
        ForEach(books, id: \.self) { book in
          HStack {
            ImageView(image: book.bookImage)
              .padding(.trailing)
            VStack(alignment: .leading, spacing: 5) {
              Text("\(book.author)")
                .font(.system(size: 12, weight: .ultraLight, design: .serif))
              Text("\(book.title)")
                .font(.system(size: 14, weight: .bold, design: .serif))
            }
            Spacer()
            // swiftlint:disable:next force_unwrapping
            Link("Buy", destination: URL(string: "\(book.amazonProductURL)")!)
              .modifier(ButtonViewModifier())
          }
          .padding()
        }
      }
    }
  }
}


#Preview {
  ShelvesView(books: [
    Book(
      id: "1234",
      author: "author",
      amazonProductURL: "url",
      bookImage: "image",
      description: "description",
      title: "title",
      rank: 1,
      rankLastWeek: 2)
  ])
}
