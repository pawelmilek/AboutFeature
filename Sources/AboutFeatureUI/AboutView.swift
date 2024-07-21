//
//  AboutView.swift
//  AboutFeature
//
//  Created by Pawel Milek on 12/21/23.
//  Copyright © 2023 Pawel Milek. All rights reserved.
//

import SwiftUI
import StoreKit

public struct AboutView: View {
    @ObservedObject var viewModel: AboutViewModel
    @Environment(\.openURL) private var openURL
    @Environment(\.dismiss) private var dismiss
    let tintColor: Color
    let accentColor: Color

    public init(
        viewModel: AboutViewModel,
        tintColor: Color,
        accentColor: Color
    ) {
        self.viewModel = viewModel
        self.tintColor = tintColor
        self.accentColor = accentColor
    }

    public var body: some View {
        NavigationStack {
            Form {
                Section {
                    AboutRow(
                        tintColor: tintColor,
                        accent: accentColor,
                        symbol: "apps.iphone",
                        title: "Application",
                        content: viewModel.appName
                    )
                    AboutRow(
                        tintColor: tintColor,
                        accent: accentColor,
                        symbol: "gear",
                        title: "Version",
                        content: viewModel.appVersion
                    )
                    AboutRow(
                        tintColor: tintColor,
                        accent: accentColor,
                        symbol: "info.circle",
                        title: "Compatibility",
                        content: viewModel.appCompatibility
                    )
                    if let appStoreShareURL = viewModel.appStoreShareURL {
                        ShareRow(
                            item: appStoreShareURL,
                            tintColor: tintColor,
                            accent: accentColor
                        )
                    }
                } header: {
                    Text("App")
                }
                Section {
                    if let appStorePreviewURL = viewModel.appStorePreviewURL {
                        AboutLinkRow(
                            tintColor: tintColor,
                            symbol: "apps.iphone",
                            title: "Apps Preview",
                            url: appStorePreviewURL
                        )
                        .simultaneousGesture(TapGesture().onEnded() {
                            viewModel.sendEventRowTapped("Apps Preview")
                        })
                        .popoverTip(AppStorePreviewTip(), arrowEdge: .bottom)
                        .foregroundStyle(tintColor)
                    }
                } header: {
                    Text("App Store")
                }
                Section {
                    ActionAboutRow(
                        tintColor: tintColor,
                        symbol: "envelope.fill",
                        title: "Contact",
                        action: reportFeedback
                    )
                    ActionAboutRow(
                        tintColor: .red,
                        symbol: "ant.fill",
                        title: "Report Issue",
                        action: reportIssue
                    )
                    if let writeAppStoreReviewURL = viewModel.writeAppStoreReviewURL {
                        AboutLinkRow(
                            tintColor: .yellow,
                            symbol: "star.fill",
                            title: "Rate Application",
                            url: writeAppStoreReviewURL
                        )
                        .simultaneousGesture(TapGesture().onEnded() {
                            viewModel.sendEventRowTapped("Rate Application")
                        })
                    }
                } header: {
                    Text("Feedback")
                }

                Section {
                    AboutNavigationLinkRow(
                        tintColor: tintColor,
                        symbol: "doc.plaintext.fill",
                        title: "Licenses",
                        destination: {
                            LicenseView(content: viewModel.packagesLicenseContent)
                        }
                    )
                    if let privacyPolicyURL = viewModel.privacyPolicyURL {
                        AboutLinkRow(
                            tintColor: tintColor,
                            symbol: "lock.shield.fill",
                            title: "Privacy Policy",
                            url: privacyPolicyURL
                        )
                        .simultaneousGesture(TapGesture().onEnded() {
                            viewModel.sendEventRowTapped("Privacy Policy")
                        })
                    }
                } header: {
                    Text("Documents")
                }

                Section {
                    if let dataProviderURL = viewModel.dataProviderURL {
                        AboutLinkRow(
                            tintColor: tintColor,
                            symbol: "sun.haze.fill",
                            title: "OpenWeather",
                            url: dataProviderURL
                        )
                    }
                } header: {
                    Text("Data Provider")
                } footer: {
                    CopyrightFooterView(
                        year: viewModel.currentYear,
                        accentColor: accentColor
                    )
                    .padding(.top, 10)
                }
            }
            .padding(.top, 0.25)
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                        viewModel.doneItemTapped()
                    } label: {
                        Text("Done")
                            .fontDesign(.monospaced)
                            .fontWeight(.semibold)
                    }
                    .tint(accentColor)
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .controlSize(.small)
                }
            }
        }
        .onAppear {
            viewModel.onViewAppear()
            viewModel.sendEventScreenViewed(
                className: "\(type(of: self))"
            )
        }
    }

    private func reportFeedback() {
        viewModel.report(subject: "[Feedback]", openURL)
    }

    private func reportIssue() {
        viewModel.report(subject: "[Bug]", openURL)
    }
}
