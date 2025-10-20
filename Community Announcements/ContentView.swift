//
//  ContentView.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Constants.Fonts.small)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
