//
//  ShelveListView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/13/23.
//

import SwiftUI

struct ShelveListView: View {
  let books: [Book]
  var body: some View {
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
        }
        .padding()
        
    }
    .tabItem {
      Image(systemName: "doc.text.magnifyingglass")
        .resizable()
      Text("Book Shelve")
    }
    .tag(2)
  }
}

#Preview {
    ShelveListView(books: [Book(author: "asd", amazonProductURL: "asd", bookImage: "asd", description: "asd", title: "ads", rank: 1, rankLastWeek: 2)])
}
