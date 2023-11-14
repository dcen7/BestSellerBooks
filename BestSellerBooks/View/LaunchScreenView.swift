//
//  LaunchScreenView.swift
//  BestSellerBooks
//
//  Created by Deniz Cengiz on 11/14/23.
//

import SwiftUI

struct LaunchScreenView: View {
  @State private var isActive = false
  @State private var size = 0.6
  @State private var opacity = 0.5
    
  var body: some View {
    if isActive {
      ContentView(store: BookStore())
    } else {
        VStack {
          VStack {
            Image("owl")
              .font(.system(size: 80))
              //.foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Text("BestRead")
              .font(.system(size: 26))
              .foregroundColor(.black.opacity(0.80))
          }
          .scaleEffect(size)
          .opacity(opacity)
          .onAppear {
            withAnimation(.easeIn(duration: 1.8)) {
              self.size = 1.1
              self.opacity = 1.0
            }
          }
        }
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.isActive = true
          }
        }
      }
  }
}

#Preview {
    LaunchScreenView()
}
