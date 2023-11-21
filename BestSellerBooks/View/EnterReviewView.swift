//
//  EnterReviewView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/21/23.
//

import SwiftUI

struct EnterReviewView: View {
  @Binding var review: String

  var body: some View {
    VStack {
      Section(header: Text("")) {
        TextField("Enter a review...", text: $review, axis: .vertical)
          .lineLimit(5...)
          .padding()
          .background(
            Rectangle()
              .foregroundColor(.gray.opacity(0.15))
              .cornerRadius(15)
          )
      }
    }
  }
}

#Preview {
  EnterReviewView(review: .constant("review"))
}
