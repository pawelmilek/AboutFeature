//
//  CopyrightFooterView.swift
//  AboutFeature
//
//  Created by Pawel Milek on 5/18/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import SwiftUI

struct CopyrightFooterView: View {
    let year: String
    let accentColor: Color

    var body: some View {
        Text("Copyright © \(year) All rights reserved.")
            .font(.caption)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .foregroundStyle(accentColor.opacity(0.8))
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 4)
    }
}

#Preview {
    CopyrightFooterView(
        year: Date.now.formatted(.dateTime.year()),
        accentColor: .green
    )
}
