//
//  ImageView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/11/23.
//

import SwiftUI

struct ImageView: View {
  let image: String
  var body: some View {
    AsyncImage(url: URL(string: image)) { image in
      image
        .resizable()
    } placeholder: {
      ProgressView("Loading")
        .padding()
    }
  }
}

#Preview {
    ImageView(image: "image")
}
