//
//  SingleOverlayUsingDefaultModifier.swift
//  swiftui-conditional-overlay
//
//  Created by Farhad Bagherzadeh on 29/7/2022.
//

import SwiftUI

struct SingleOverlayUsingDefaultModifier: View {
  @State var shouldHaveOverlay: Bool = false
  @State var isBlue: Bool = true

  var body: some View {
    Form {
      Section {
        Toggle("Has overlay?", isOn: $shouldHaveOverlay.animation())
      }

      Section {
        Rectangle()
          .fill(shouldHaveOverlay ? Color.gray : .black)
          .frame(height: 300)
          .overlay(shouldHaveOverlay ? dummyView : nil)
      }
    }
  }
  
  private var dummyView: some View {
    VStack {
      Rectangle()
        .fill(isBlue ? .blue : .red)
        .frame(height: 100)

      Button("Tap me!") { withAnimation { isBlue.toggle() } }
        .buttonStyle(.borderedProminent)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    SingleOverlayUsingDefaultModifier()
  }
}
