//
//  AnnouncementCellView.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 20/10/2025.
//

import SwiftUI

struct AnnouncementCellView: View {
    let viewModel: AnnouncementViewModel

    var body: some View {
        HStack(spacing: Constants.Spacing.medium) {
            headerImage
                .cornerRadius(Constants.Spacing.large)
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 250)
            announcementBody
        }
        .background(Constants.Colors.background)
        .padding(Constants.Spacing.medium)
    }

    var likeButton: some View{
        Button {
        } label: {
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                Text("\(viewModel.likes)")
                    .font(Constants.Fonts.subtitle)
            }
        }

    }

    var announcementTitle: some View{
        Text(viewModel.title)
            .font(Constants.Fonts.title)
            .lineLimit(2)
    }

    var announcementBody: some View{
        VStack(alignment: .leading, spacing: Constants.Spacing.medium) {
            announcementTitle
            announcementAuthor
            likeButton
        }
    }

    var announcementAuthor: some View{
        HStack {
            Image(systemName: "person.circle")
            Text(viewModel.author.name)
                .font(Constants.Fonts.caption)
        }
    }

    @ViewBuilder
    var headerImage: some View {
        if let imageURL = viewModel.imageURL {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                //                 ShimmeringAnimatedView()
            }
        } else {
            Image("placeholder")
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    AnnouncementCellView(
        viewModel: AnnouncementViewModel(
            id: UUID(),
            author: Author(id: "2223", name: "Jessica Brown"),
            title: "test community BBQ This Saturday",
            body: "We’re hosting our annual neighborhood BBQ this Saturday at the park! Bring a side dish or dessert to share. Burgers, hot dogs, and veggie options will be provided. Family and friends are welcome!",
            likes: 12,
            onPressLike: {},
            onPressFavorite: {})
    )
}
