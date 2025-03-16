//
//  ProfileCoordinator.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

final class ProfileCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    @Published var isSheetPresented = false
    @Published var sheetContent: AnyView?
    @Published var isFullscreenPresented = false

    func navigate(to destination: ProfileDestination) {
        navigationPath.append(destination)
    }
}
