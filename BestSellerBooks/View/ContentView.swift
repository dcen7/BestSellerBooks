//
//  ContentView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/10/23.
//

import SwiftUI

struct ContentView: View {
  @StateObject var store: BookStore
  @State private var fetchObjectsTask: Task<Void, Error>?
  @AppStorage("selectedTab")
  var selectedTab = 1

  var body: some View {
    TabView(selection: $selectedTab) {
      BookListView(store: store, fetchObjectsTask: $fetchObjectsTask)
      ShelvesListView(books: store.filteredBooks)
    }
  }
}

#Preview {
  ContentView(store: BookStore())
}
