//
//  Announcement.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import Foundation

public struct Announcement: Decodable {
    let id: String
    let title: String
    let body: String
    let author: Author
    let createdAt: Date
    var likes: Int
    let imageUrl: String?

    private enum CodingKeys: String, CodingKey {
        case id, title, body, author, createdAt, likes, imageUrl
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
        author = try container.decode(Author.self, forKey: .author)
        likes = try container.decode(Int.self, forKey: .likes)
        imageUrl = try? container.decodeIfPresent(String.self, forKey: .imageUrl)

        let dateString = try container.decode(String.self, forKey: .createdAt)

        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        if let date = formatter.date(from: dateString) {
            createdAt = date
        } else if let dateWithoutFraction = ISO8601DateFormatter().date(from: dateString) {
            createdAt = dateWithoutFraction
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .createdAt,
                in: container,
                debugDescription: "Date string does not match ISO8601 format."
            )
        }
    }
}
