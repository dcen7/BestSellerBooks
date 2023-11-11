//
//  BookDetailView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import SwiftUI

struct BookDetailView: View {
  let book: Book
  var body: some View {
    Text("\(book.description)")
  }
}


#Preview {
  BookDetailView(book: Book(author: "Dostoyevski", amazonProductURL: "link", bookImage: "Image", description: "Description", title: "Karamazov Brothers", rank: 1, rankLastWeek: 1))
}
