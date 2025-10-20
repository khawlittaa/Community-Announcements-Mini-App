//
//  AnnouncementLisViewModelProtocol.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 20/10/2025.
//

import Foundation

protocol AnnouncementViewModelProtocol: Identifiable {
    var id: UUID { get }
    var author: Author { get }
    var title: String { get }
    var body: String { get }
    var createdAt: Date { get }
    var likes: Int { get }
    var imageURL: URL? { get }

    var onPressLike: @MainActor () -> Void { get set }
    var onPressFavorite: @MainActor () -> Void { get set }
}
