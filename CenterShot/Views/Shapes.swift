//
//  Shapes.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 29/10/23.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = true
  
  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
          .strokeBorder(Color.blue, lineWidth: 20)
          .frame(width: 200, height: 100)
          .background(Color.green)
          .transition(.scale)
      }
      RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        .fill(.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
//        .animation(.easeIn, value: wideShapes)
      Capsule()
        .fill(.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Ellipse()
        .fill(.blue)
        .frame(width: wideShapes ? 200 : 100, height: 100)
      Button("Animate") {
        withAnimation {
          wideShapes.toggle()
        }
      }
    }
  }
}

#Preview {
  Shapes()
}
