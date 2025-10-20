//
//  Constants.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import SwiftUI

enum Constants {

    // MARK: - Colors
    enum Colors {
        static let primary = Color(red: 205, green: 180, blue: 219)
        static let secondary =  Color(red: 255, green: 200, blue: 221)
        static let accent = Color(red: 189, green: 224, blue: 254)
        static let background = Color(red: 248, green: 249, blue: 250)
        static let textPrimary = Color(red: 30, green: 30, blue: 30)
        static let textSecondary = Color(red: 108, green: 117, blue: 125)
        static let error = Color(red: 255, green: 107, blue: 107)
    }

    // MARK: - Spacing
    enum Spacing {
        static let xSmall: CGFloat = 2
        static let small: CGFloat = 4
        static let medium: CGFloat = 8
        static let large: CGFloat = 16
        static let XLarge: CGFloat = 32
    }

    // MARK: - Fonts
    enum Fonts {
        static let title = Font.system(size: 22, weight: .semibold, design: .rounded)
        static let subtitle = Font.system(size: 18, weight: .medium, design: .rounded)
        static let body = Font.system(size: 16, weight: .regular, design: .default)
        static let caption = Font.system(size: 14, weight: .regular, design: .default)
        static let small = Font.system(size: 12, weight: .regular, design: .default)
    }
}
