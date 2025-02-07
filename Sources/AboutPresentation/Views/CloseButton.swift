//
//  SwiftUIView.swift
//  AboutFeature
//
//  Created by Pawel Milek on 2/7/25.
//

import SwiftUI

private enum Constant {
    static let size = CGSize(width: 24, height: 24)
    static let padding: CGFloat = 8
    static let opacity: CGFloat = 0.4
}

struct CloseButton: View {
    let foreground: Color
    let background: Color
    var didTap: () -> Void

    var body: some View {
        Button(action: didTap) {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .fontWeight(.bold)
                .foregroundStyle(foreground)
                .padding(Constant.padding)
                .background(background.opacity(Constant.opacity), in: Circle())
                .frame(
                    width: Constant.size.width,
                    height: Constant.size.height,
                    alignment: .center
                )
        }
    }
}

#Preview {
    NavigationStack {
        Color.white.ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    CloseButton(foreground: .white, background: .orange, didTap: {})
                }
            }
    }
}
