//
//  AnniuncementDataSource.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 20/10/2025.
//

import Foundation

public class AnnouncementDataSource {
    public func fetchAnnouncements() async throws -> [Announcement] {
        let url = URL(string: "http://localhost:8080/neighborhoodAnnouncements.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let announcements = try decoder.decode([Announcement].self, from: data)
        return announcements
    }
}
