//
//  AnnouncementView.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import SwiftUI

struct AnnouncementView: View {
    let viewModel: AnnouncementViewModel
    var body: some View {
        HStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            announcementAuthor
        }
    }

    var announcementAuthor: some View{
        HStack {
            Image(systemName: "person.circle")
            Text(viewModel.author.name)
                .font(Constants.Fonts.body)
        }
    }
}

#Preview {
    AnnouncementView(
        viewModel: AnnouncementViewModel(
            id: UUID(),
            author: Author(id: "2223", name: "author"),
            title: "test",
            body: "",
            likes: 12,
            onPressLike: {},
            onPressFavorite: {})
    )
}
