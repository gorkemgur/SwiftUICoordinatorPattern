//
//  ProfileView.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var coordinator: ProfileCoordinator
    @StateObject private var viewModel: ProfileViewModel
    
    init(coordinator: ProfileCoordinator, viewModel: ProfileViewModel) {
        self._coordinator = StateObject(wrappedValue: coordinator)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            VStack(spacing: 24) {
                // Avatar
                Image(systemName: viewModel.profile.avatar)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding()
                
                // User Info
                Text(viewModel.profile.name)
                    .font(.title2)
                    .bold()
                
                Text(viewModel.profile.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Actions
                VStack(spacing: 12) {
                    Button(action: {
                        coordinator.navigate(to: .editProfile)
                    }) {
                        Label("Profil Düzenle", systemImage: "person.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Profil")
            .navigationDestination(for: ProfileDestination.self) { destination in
                switch destination {
                case .editProfile:
                    EditProfileView(coordinator: coordinator, viewModel: viewModel)
                }
            }
        }
    }
}
