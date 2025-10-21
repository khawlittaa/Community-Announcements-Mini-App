//
//  AnnouncementRepository.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 21/10/2025.
//

import Foundation

actor AnnouncementRepository {
    private var announcements: [Announcement] = []
    private let dataSource = AnnouncementDataSource()
    private let failureRate = 0.15 // 15% chance of failure for POST

    init() {}

    func fetchAnnouncements() async throws -> [Announcement] {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 800_000_000)
        // Initial load from local data source only once
        if announcements.isEmpty {
            announcements = try await dataSource.fetchAnnouncements()
        }
        return announcements.sorted { $0.createdAt > $1.createdAt }
    }

    func likeAnnouncement(id: String) async throws -> Announcement {
        // Simulate network delay
        try await Task.sleep(nanoseconds: 600_000_000)
        // Random failure simulation
        if Double.random(in: 0..<1) < failureRate {
            throw NSError(domain: "NetworkError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to like announcement"])
        }
        if let index = announcements.firstIndex(where: { $0.id == id }) {
            var updated = announcements[index]
            updated.likes += 1
            announcements[index] = updated
            return updated
        } else {
            throw NSError(domain: "NotFound", code: 404)
        }
    }

    func addAnnouncement(_ newAnnouncement: Announcement) async throws {
        // Simulate delay and failure similarly if desired, here assuming success
        try await Task.sleep(nanoseconds: 800_000_000)
        announcements.append(newAnnouncement)
    }
}

