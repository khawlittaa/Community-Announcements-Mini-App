//
//  AnnouncementListViewModel.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import Foundation

class announcementAuthorView: AnnouncementListViewModelProtocol {
    var AnnouncementViewModels: [any AnnouncementViewModelProtocol]

    init(AnnouncementViewModels: [any AnnouncementViewModelProtocol]) {
        self.AnnouncementViewModels = AnnouncementViewModels
    }
}
