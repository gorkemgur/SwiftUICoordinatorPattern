//
//  swiftuicoordinatorpatternApp.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

@main
struct SwiftUICoordinatorPatternApp: App {
    @State private var selectedTab: TabSelection = .home
    @State private var isSelectedSameTab: Bool = false
    
    private let coordinatorFactory = AppCoordinatorFactory()
    
    private let homeCoordinator: HomeCoordinator
    private let profileCoordinator: ProfileCoordinator
    
    init() {
        homeCoordinator = coordinatorFactory.makeHomeCoordinator()
        profileCoordinator = coordinatorFactory.makeProfileCoordinator()
    }
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: tabSelection()) {
                HomeView(coordinator: homeCoordinator, viewModel: HomeViewModel())
                    .tabItem {
                        Label("Ana Sayfa", systemImage: "house")
                    }
                    .tag(TabSelection.home)
                
                ProfileView(coordinator: profileCoordinator, viewModel: ProfileViewModel())
                    .tabItem {
                        Label("Profil", systemImage: "person")
                    }
                    .tag(TabSelection.profile)
            }
        }
    }
}

extension SwiftUICoordinatorPatternApp {
    private func tabSelection() -> Binding<TabSelection> {
        Binding {
            self.selectedTab
        } set: { newValue in
            if newValue == self.selectedTab {
                switch selectedTab {
                case .home:
                    homeCoordinator.navigateToRoot()
                case .profile:
                    profileCoordinator.navigateToRoot()
                }
            }
            self.selectedTab = newValue
        }
     }
}

enum TabSelection: Int {
    case home = 0
    case profile = 1
}
