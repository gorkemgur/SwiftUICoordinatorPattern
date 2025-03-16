//
//  EditProfileView.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

struct EditProfileView: View {
    @ObservedObject var coordinator: ProfileCoordinator
    @ObservedObject var viewModel: ProfileViewModel
    @State private var name: String
    @State private var email: String
    
    init(coordinator: ProfileCoordinator, viewModel: ProfileViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        _name = State(initialValue: viewModel.profile.name)
        _email = State(initialValue: viewModel.profile.email)
    }
    
    var body: some View {
        Form {
            Section("Kişisel Bilgiler") {
                TextField("İsim", text: $name)
                TextField("E-posta", text: $email)
            }
            
            Section {
                Button("Kaydet") {
                    viewModel.updateProfile(ProfileInfo(name: name, email: email))
                    coordinator.navigateBack()
                }
            }
        }
        .navigationTitle("Profil Düzenle")
    }
}
