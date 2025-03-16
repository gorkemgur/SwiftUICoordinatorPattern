//
//  Coordinator.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    // Each Coordinator has it own destination
    associatedtype Destination: Hashable
    
    var navigationPath: NavigationPath { get set }
    var isSheetPresented: Bool { get set }
    var isFullscreenPresented: Bool { get set }
    var sheetContent: AnyView? { get set }
    
    func navigate(to destination: Destination)
    func navigateBack()
    func navigateToRoot()
    func presentSheet<Content: View>(content: Content)
    func presentFullscreen<Content: View>(content: Content)
    func dismissSheet()
}

extension Coordinator {
    func navigateBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func navigateToRoot() {
        navigationPath = .init()
    }
    
    func presentSheet<Content: View>(content: Content) {
        sheetContent = AnyView(content)
        isSheetPresented = true
        isFullscreenPresented = false
    }
    
    func presentFullscreen<Content: View>(content: Content) {
        sheetContent = AnyView(content)
        isFullscreenPresented = true
        isSheetPresented = false
    }
    
    func dismissSheet() {
        isSheetPresented = false
        isFullscreenPresented = false
        sheetContent = nil
    }
}
