//
//  AnnouncementViewModel.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import Foundation

class AnnouncementViewModel: AnnouncementViewModelProtocol, Identifiable {
    var id: UUID
    var author: Author
    var title: String
    var body: String
    var createdAt: Data?
    var likes: Int
    var imageURL: String?
    
    var onPressLike: @MainActor @Sendable () -> Void
    var onPressFavorite: @MainActor @Sendable () -> Void

    init(id: UUID,
         author: Author,
         title: String,
         body: String,
         createdAt: Data? = nil,
         likes: Int,
         imageURL: String? = nil,
         onPressLike: @Sendable @escaping () -> Void,
         onPressFavorite: @Sendable @escaping () -> Void) {
        self.id = id
        self.author = author
        self.title = title
        self.body = body
        self.createdAt = createdAt
        self.likes = likes
        self.imageURL = imageURL
        self.onPressLike = onPressLike
        self.onPressFavorite = onPressFavorite
    }
}
