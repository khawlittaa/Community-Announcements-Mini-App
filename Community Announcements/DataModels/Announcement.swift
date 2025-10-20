//
//  Announcement.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import Foundation

struct Announcement: Codable {
    let id: String
    let title: String
    let body: String
    let author: Author
    let createdAt: Date
    let likes: Int
    let imageUrl: String?
}
