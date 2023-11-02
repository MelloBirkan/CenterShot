//
//  Shapes.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 29/10/23.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    VStack {
      Circle()
        .strokeBorder(Color.blue, lineWidth: 20)
        .frame(width: 200, height: 100)
        .background(Color.green)
      RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
        .fill(.blue)
        .frame(width: 200, height: 100)
      Capsule()
        .fill(.blue)
        .frame(width: 200, height: 100)
      Ellipse()
        .fill(.blue)
        .frame(width: 200, height: 100)
    }
  }
}

#Preview {
  Shapes()
}
