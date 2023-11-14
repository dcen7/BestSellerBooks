//
//  TextViews.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/14/23.
//

import SwiftUI

struct CustomTextView: View {
  let text: String
  let size: CGFloat
    var body: some View {
        Text(text)
        .font(.system(size: size, weight: .ultraLight, design: .serif))
    }
}

#Preview {
  CustomTextView(text: "Hello", size: 12)
}
