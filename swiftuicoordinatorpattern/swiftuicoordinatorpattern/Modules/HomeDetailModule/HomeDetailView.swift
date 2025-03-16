//
//  HomeDetailView.swift
//  swiftuicoordinatorpattern
//
//  Created by Görkem Gür on 16.03.2025.
//

import SwiftUI

struct HomeDetailView: View {
    let item: String
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(item)
                .font(.title)
                .bold()
            
            Text(item.description)
                .font(.body)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .navigationTitle(item)
    }
}
