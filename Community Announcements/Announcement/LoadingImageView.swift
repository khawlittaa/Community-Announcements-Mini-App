//
//  LoadingImageView.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 21/10/2025.
//

import SwiftUI

struct LoadingImageView: View {
    @State private var isAnimating = false

    var body: some View {
        Image("loading_spinner") // your image asset name here
            .resizable()
            .frame(width: 50, height: 50)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(
                Animation.linear(duration: 1).repeatForever(autoreverses: false),
                value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
            .accessibilityLabel("Loading")
    }
}
