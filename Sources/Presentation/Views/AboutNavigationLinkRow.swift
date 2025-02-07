//
//  AboutNavigationLinkRow.swift
//  AboutFeature
//
//  Created by Pawel Milek on 6/3/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//
// swiftlint:disable force_try

import SwiftUI

struct AboutNavigationLinkRow<Content: View>: View {
    let tintColor: Color
    let symbol: String
    let title: String
    @ViewBuilder let destination: Content

    var body: some View {
            NavigationLink {
                destination
            } label: {
                labelView
            }
    }

    private var labelView: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 30, height: 30)
                    .foregroundStyle(tintColor)
                Image(systemName: symbol)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)

            }
            Text(title)
                .font(.footnote)
                .fontDesign(.monospaced)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
