//
//  CoordinatorFactory.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

protocol CoordinatorFactory {
    func makeHomeCoordinator() -> HomeCoordinator
    func makeProfileCoordinator() -> ProfileCoordinator
}

class AppCoordinatorFactory: CoordinatorFactory {
    func makeHomeCoordinator() -> HomeCoordinator {
        return HomeCoordinator()
    }
    
    func makeProfileCoordinator() -> ProfileCoordinator {
        return ProfileCoordinator()
    }
}
