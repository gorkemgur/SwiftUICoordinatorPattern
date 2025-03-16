//
//  ProfileInfoModel.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import Foundation

struct ProfileInfo: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let email: String
    let avatar: String = "person.circle.fill"
}
