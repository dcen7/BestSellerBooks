//
//  EmptyShelveView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/21/23.
//

import SwiftUI


struct EmptyShelveView: View {
  @Environment(\.colorScheme)
  var colorScheme

  var body: some View {
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
  }
}

#Preview {
  EmptyShelveView()
}
