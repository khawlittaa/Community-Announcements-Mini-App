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
        VStack(alignment: .leading, spacing: Constants.Spacing.medium) {
            headerImage
                .cornerRadius(Constants.Spacing.large)
            likeButton
            announcementTitle
            announcementBody
            eventDate
            announcementAuthor
            Spacer()
        }
        .background(Constants.Colors.background)
        .padding(Constants.Spacing.large)
    }


    var eventDate: some View {
    Text(" createdAt: \(viewModel.createdAt.description)")
        .font(Constants.Fonts.caption)
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
            Text(viewModel.body)
                .font(Constants.Fonts.body)
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
                 Image("placeholder")
                     .resizable()
                     .scaledToFit()
             }
         } else {
             Image("placeholder")
                 .resizable()
                 .scaledToFit()
         }
    }
}
