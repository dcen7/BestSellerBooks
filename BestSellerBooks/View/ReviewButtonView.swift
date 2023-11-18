//
//  ReviewButtonView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/18/23.
//

import SwiftUI

struct ReviewButtonView: View {
  var body: some View {
    HStack {
      Image(systemName: "plus")
      Text("Add a review")
    }
  }
}

#Preview {
  ReviewButtonView()
}
