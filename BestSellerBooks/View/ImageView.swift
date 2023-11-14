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
        .frame(width: 70, height: 100)
        .aspectRatio(contentMode: .fit)
        .clipShape(Rectangle())
        .overlay(Rectangle().stroke(Color.gray, lineWidth: 1.3))
        .shadow(color: .black, radius: 5)
    } placeholder: {
      ProgressView("Loading")
        .padding()
    }
  }
}

#Preview {
  ImageView(image: "image")
}
