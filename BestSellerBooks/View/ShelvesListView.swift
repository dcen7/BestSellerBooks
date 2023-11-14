//
//  ShelveListView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/13/23.
//

import SwiftUI

struct ShelvesListView: View {
  let books: [Book]
  var body: some View {
    NavigationStack {
    List(books, id: \.self) { book in
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
        Link("BUY", destination: URL(string: "\(book.amazonProductURL)")!)
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
          .font(.footnote)
      }
      .padding()
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
      author: "asd",
      amazonProductURL: "asd",
      bookImage: "asd",
      description: "asd",
      title: "ads",
      rank: 1,
      rankLastWeek: 2)
  ])
}
