//
//  AnnouncementListViewModel.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import Foundation
import Combine

@MainActor
class AnnouncementListViewModel: ObservableObject {
    @Published var announcements: [AnnouncementViewModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let repository = AnnouncementRepository()

    func refresh() async {
        isLoading = true
        errorMessage = nil
        do {
            let models = try await repository.fetchAnnouncements()
            self.announcements = models.map { model in
                AnnouncementViewModel(
                    announcement: model,
                    onPressLike: { [weak self] in await self?.likeAnnouncement(id: model.id) }
                )
            }
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    private func likeAnnouncement(id: String) async {
        // Optimistic update
        guard let index = announcements.firstIndex(where: { $0.id == id }) else { return }
        announcements[index].likes += 1

        do {
            let updated = try await repository.likeAnnouncement(id: id)
            announcements[index].likes = updated.likes
        } catch {
            // Rollback like count on failure
            announcements[index].likes -= 1
            errorMessage = error.localizedDescription
        }
    }
}

