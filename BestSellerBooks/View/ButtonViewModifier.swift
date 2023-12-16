//
//  ButtonViewModifier.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/18/23.
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(12)
      .background(
        ZStack {
          Color(Color.blue)
          LinearGradient(
            gradient: Gradient(
              colors: [Color.white.opacity(0.3), Color.clear]),
            startPoint: .top,
            endPoint: .bottom)
        }
      )
      .overlay(
        RoundedRectangle(cornerRadius: 21)
          .strokeBorder(Color.white, lineWidth: 2)
      )
      .foregroundColor(.white)
      .cornerRadius(21)
      .bold()
  }
}
