//
//  ContentView.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

#warning("DEPRECATION")

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
