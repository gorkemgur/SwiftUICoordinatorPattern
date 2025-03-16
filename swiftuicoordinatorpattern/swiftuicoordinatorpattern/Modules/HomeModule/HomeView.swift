//
//  HomeView.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var coordinator: HomeCoordinator
    @StateObject private var viewModel: HomeViewModel
    
    init(coordinator: HomeCoordinator, viewModel: HomeViewModel) {
        self._coordinator = StateObject(wrappedValue: coordinator)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(viewModel.items, id: \.self) { item in
                        VStack(alignment: .leading) {
                            Text(item)
                                .font(.headline)
                            Text("Description for \(item)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .onTapGesture {
                            coordinator.navigate(to: .detail(title: item))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
            }
            .navigationTitle("Ana Sayfa")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        coordinator.presentSheet(content: SettingsSheetView(coordinator: coordinator))
                    }) {
                        Image(systemName: "figure.walk")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        coordinator.navigate(to: .settings)
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
            .navigationDestination(for: HomeDestination.self) { destination in
                switch destination {
                case .detail(let item):
                    HomeDetailView(item: item, coordinator: coordinator)
                case .settings:
                    SettingsView()
                }
            }
        }
        .sheet(isPresented: $coordinator.isSheetPresented) {
            coordinator.sheetContent
        }
    }
}
