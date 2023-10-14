//
//  ContentView.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 13/10/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Text("PUT THE BULLSEYE AS CLOSE AS YOU CAN TO 89")
      Text("89")
      HStack {
        Text("1")
        Slider(value: .constant(50), in: 1.0...100.0)
        Text("100")
      }
    }
  }
}

#Preview {
  ContentView()
}
