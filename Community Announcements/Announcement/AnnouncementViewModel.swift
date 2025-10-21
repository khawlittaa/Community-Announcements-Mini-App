//
//  AnnouncementViewModel.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import Foundation
import Combine

class AnnouncementViewModel: ObservableObject, Identifiable {
    let id: String
    let author: Author
    let title: String
    let body: String
    let createdAt: Date
    @Published var likes: Int
    let image: String?
    let onPressLike: () async -> Void

    init(announcement: Announcement, onPressLike: @escaping () async -> Void) {
        self.id = announcement.id
        self.author = announcement.author
        self.title = announcement.title
        self.body = announcement.body
        self.createdAt = announcement.createdAt
        self.likes = announcement.likes
        self.image = announcement.imageUrl
        self.onPressLike = onPressLike
    }
}
