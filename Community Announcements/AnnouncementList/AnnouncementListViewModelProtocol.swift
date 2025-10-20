//
//  AnnouncementListViewModelProtocol.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 20/10/2025.
//

import Foundation

protocol AnnouncementListViewModelProtocol {
    var AnnouncementViewModels: [any AnnouncementViewModelProtocol] { get }
}
