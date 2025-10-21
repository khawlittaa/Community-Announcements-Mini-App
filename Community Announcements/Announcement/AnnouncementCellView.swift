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

    // Modify likeButton in AnnouncementCellView to support async like action
    var likeButton: some View {
        Button {
            Task {
                await viewModel.onPressLike()
            }
        } label: {
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                Text("\(viewModel.likes)")
                    .font(Constants.Fonts.subtitle)
            }
        }
        .buttonStyle(BorderlessButtonStyle()) // to prevent row selection on tap
        .accessibilityLabel("Like announcement")
        .accessibilityValue("\(viewModel.likes) likes")
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
        if let imageURL = viewModel.image {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                LoadingImageView()
            }
        } else {
            Image("placeholder")
                .resizable()
                .scaledToFit()
        }
    }
}

