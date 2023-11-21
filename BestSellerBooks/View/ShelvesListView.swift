//
//  ShelveListView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/13/23.
//

import SwiftUI

struct ShelvesListView: View {
  let books: [Book]
  @Environment(\.colorScheme)
  var colorScheme

  var body: some View {
    NavigationStack {
      ZStack {
        if books.isEmpty {
          VStack(spacing: 20) {
            CustomTextView(text: "There are no books in the shelve...", size: 17)
              .padding(.top)
            CustomTextView(text: "You can add from book detail screen.", size: 12)
              .padding()
          }
          .padding()
          .frame(maxWidth: 300)
          .background(colorScheme == .dark ? .blue : .white)
          .cornerRadius(21)
          .shadow(radius: 10, x: 5, y: 5)
        } else {
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
      .navigationTitle("Book Shelves")
    }
    .tabItem {
      Image(systemName: "doc.text.magnifyingglass")
        .resizable()
      Text("Book Shelves")
    }
    .tag(2)
  }
}

#Preview {
  ShelvesListView(books: [
    Book(
      id: "234",
      author: "asd",
      amazonProductURL: "asd",
      bookImage: "asd",
      description: "asd",
      title: "ads",
      rank: 1,
      rankLastWeek: 2)
  ])
}
