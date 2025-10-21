//
//  AnnouncementListView.swift
//  Community Announcements
//
//  Created by khaoula hafsia on 19/10/2025.
//

import SwiftUI

struct AnnouncementListView: View {
    @StateObject private var viewModel = AnnouncementListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading && viewModel.announcements.isEmpty {
                    ProgressView("Loading announcements...")
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Text("Error: \(error)")
                        Button("Retry") {
                            Task { await viewModel.refresh() }
                        }
                    }.padding()
                } else if viewModel.announcements.isEmpty {
                    Text("No announcements available")
                        .foregroundColor(.secondary)
                } else {
                    List(viewModel.announcements.sorted(by: { $0.createdAt > $1.createdAt })) { announcement in
                        NavigationLink(destination: AnnouncementView(viewModel: announcement)) {
                            AnnouncementCellView(viewModel: announcement)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        await viewModel.refresh()
                    }
                }
            }
            .navigationTitle("New Announcements:")
            .task {
                await viewModel.refresh()
            }
        }
    }
}

#Preview {
    AnnouncementListView()
}
