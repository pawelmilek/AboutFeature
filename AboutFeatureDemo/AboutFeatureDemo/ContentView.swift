//
//  ContentView.swift
//  AboutFeatureDemo
//
//  Created by Pawel Milek on 2/7/25.
//

import SwiftUI
import Presentation

struct ContentView: View {
    @EnvironmentObject private var viewMdoel: AboutViewModel

    var body: some View {
        AboutView(
            viewModel: viewMdoel,
            tintColor: .customPrimary,
            accentColor: .accent
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(Preview.viewModel)
}
