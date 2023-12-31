//
//  ShelvesView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/21/23.
//

import SwiftUI

struct ShelvesView: View {
  @ObservedObject var store: BookStore

  var body: some View {
    List {
      ForEach(store.wantToReadBooks, id: \.self) { book in
        HStack {
          ImageView(image: book.bookImage)
            .padding(.trailing)
          VStack(alignment: .leading, spacing: 5) {
            Text("\(book.author)")
              .font(.system(size: 12, weight: .ultraLight, design: .serif))
            Text("\(book.title)")
              .font(.system(size: 14, weight: .bold, design: .serif))
            ScrollView(.horizontal, showsIndicators: false) {
              HStack {
                ForEach(book.buyLinks, id: \.url) { link in
                  // swiftlint:disable:next force_unwrapping
                  Link("\(link.name)", destination: URL(string: "\(link.url)")!)
                    .modifier(ButtonViewModifier())
                    .font(.footnote)
                    .padding(.top)
                }
              }
            }
          }
          Spacer()
        }
      }
      .onDelete { indexSet in
        removeRows(at: indexSet)
      }
    }
  }

  func removeRows(at offsets: IndexSet) {
    store.wantToReadBooks.remove(atOffsets: offsets)
  }
}

#Preview {
  ShelvesView(store: BookStore())
}
