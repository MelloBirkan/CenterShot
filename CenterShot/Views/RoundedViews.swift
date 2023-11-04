//
//  RoundedViews.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 30/10/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName: String
  
  var body: some View {
    ZStack {
      Image(systemName: systemName)
        .font(.title)
        .foregroundColor(Color("TextColor"))
        .frame(width: 56, height: 56)
        .overlay(
          Circle()
            .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
        )
    }
  }
}

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    ZStack {
      Image(systemName: systemName)
        .font(.title)
        .foregroundColor(Color("ButtonFilledTextColor"))
        .frame(width: 56, height: 56)
        .background(
          Circle()
            .fill(Color("ButtonFilledBackgroundColor")))
    }
  }
}


struct RoundedRectTextView: View {
  var number: String
  
  var body: some View {
    Text(number)
      .kerning(-0.2)
      .font(.title3)
      .bold()
      .frame(width: 68, height: 55.78125)
      .foregroundStyle(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: 21)
          .stroke(lineWidth: 2)
          .foregroundStyle(Color("ButtonStrokeColor"))
      )
  }
}

    
    struct PreviewView: View {
      var body: some View {
        HStack(spacing: 10) {
          RoundedImageViewStroked(systemName: "list.dash")
          RoundedImageViewFilled(systemName: "arrow.counterclockwise")
          RoundedRectTextView(number: "11")
        }
      }
    }
    
    
    #Preview {
      PreviewView()
    }
