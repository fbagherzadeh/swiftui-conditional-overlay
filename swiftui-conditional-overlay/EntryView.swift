//
//  EntryView.swift
//  swiftui-conditional-overlay
//
//  Created by Farhad Bagherzadeh on 3/8/2022.
//

import SwiftUI

struct EntryView: View {
  var body: some View {
    NavigationView {
      Form {
        Section {
          navLink(title: "Using default modifier ✅") { SingleOverlayUsingDefaultModifier() }
          navLink(title: "Using 'if' modifier ❌") { SingleOverlayUsingIfModifier() }
        } header: {
          Text("Single overlay")
        } footer: {
          Text("Conditions in which we either have an overlay view or don't!")
        }

        Section {
          navLink(title: "Using default modifier ✅") { MultipleOverlayUsingDefaultModifier() }
          navLink(title: "Using if modifier ❌") { MultipleOverlayUsingIfModifier() }
          navLink(title: "Using AnyView ❌") { MultipleOverlayUsingAnyView() }
          navLink(title: "Using Overlay & ViewBuilder ✅") { MultipleOverlayUsingOverlayAndViewBuilder() }
        } header: {
          Text("Multiple overlay")
        } footer: {
          Text("Conditions in which we either have one overlay view or another overlay view!")
        }
      }
      .navigationTitle("Conditional overlay")
    }
  }

  private func navLink<Content: View>(title: String, @ViewBuilder content: () -> Content) -> some View {
    NavigationLink(destination: content) {
      Text(title)
        .font(.subheadline)
    }
  }
}

struct EntryView_Previews: PreviewProvider {
  static var previews: some View {
    EntryView()
  }
}
