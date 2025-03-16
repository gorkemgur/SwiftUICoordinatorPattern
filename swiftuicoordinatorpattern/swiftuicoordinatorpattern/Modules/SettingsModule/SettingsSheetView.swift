//
//  SettingsSheetView.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

struct SettingsSheetView: View {
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        NavigationStack {
            List {
                Text("Hızlı Ayar 1")
                Text("Hızlı Ayar 2")
                Text("Hızlı Ayar 3")
            }
            .navigationTitle("Hızlı Ayarlar")
        }
    }
}
