//
//  HomeCoordinator.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

final class HomeCoordinator: Coordinator {
    @Published var navigationPath = NavigationPath()
    @Published var isSheetPresented = false
    @Published var sheetContent: AnyView?
    @Published var isFullscreenPresented = false
    
    func navigate(to destination: HomeDestination) {
        navigationPath.append(destination)
    }
}
