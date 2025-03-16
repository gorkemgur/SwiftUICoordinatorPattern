//
//  ProfileViewModel.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    @Published var profile = ProfileInfo(
        name: "Ahmet Yılmaz",
        email: "ahmet@example.com"
    )
    
    func updateProfile(_ newProfile: ProfileInfo) {
        self.profile = newProfile
    }
}

