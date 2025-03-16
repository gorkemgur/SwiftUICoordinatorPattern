//
//  SettingsView.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            Text("Profil Ayarları")
            Text("Görünüm Ayarları")
            Text("Bildirim Ayarları")
        }
        .navigationTitle("Ayarlar")
    }
}
