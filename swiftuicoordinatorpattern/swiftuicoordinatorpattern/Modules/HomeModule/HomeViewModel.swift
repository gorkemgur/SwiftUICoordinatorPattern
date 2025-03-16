//
//  HomeViewModel.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var items: [String] = ["First Item", "Second Item", "Third Item"]
}
