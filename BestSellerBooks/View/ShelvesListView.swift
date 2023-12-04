//
//  ShelveListView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/13/23.
//

import SwiftUI

struct ShelvesListView: View {
  @ObservedObject var store: BookStore

  var body: some View {
    NavigationStack {
      ZStack {
        if store.wantToReadBooks.isEmpty {
          EmptyShelveView()
        } else {
          ShelvesView(store: store)
        }
      }
      .navigationTitle("Book Shelves")
    }
    .tabItem {
      Image(systemName: "books.vertical.fill")
        .resizable()
      Text("Book Shelves")
    }
    .tag(2)
  }
}

#Preview {
  ShelvesView(store: BookStore())
}
