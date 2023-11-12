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
        .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
        .overlay(
          Circle()
            .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
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
        .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
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
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .foregroundStyle(Color("TextColor"))
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .stroke(lineWidth: Constants.General.strokeWidth)
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
