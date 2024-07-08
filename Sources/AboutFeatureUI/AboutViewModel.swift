//
//  AboutViewModel.swift
//  AboutFeature
//
//  Created by Pawel Milek on 1/24/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import SwiftUI
import AboutFeatureDomain

@MainActor
public final class AboutViewModel: ObservableObject {
    @Published private(set) var appName = ""
    @Published private(set) var appVersion = ""
    @Published private(set) var appCompatibility = ""
    @Published private(set) var appStorePreviewURL: URL?
    @Published private(set) var writeAppStoreReviewURL: URL?
    @Published private(set) var privacyPolicyURL: URL?
    @Published private(set) var weatherDataProviderURL: URL?
    @Published private(set) var currentYear = ""
    private let appInfo: ApplicationInfo
    private let analytics: AnalyticsAboutSendable
    private let toolbarInteractive: ToolbarInteractive
    private let networkResourceService: NetworkResourceService
    private let deviceService: DeviceService
    private let licenseService: LicenseService

    public init(
        appInfo: ApplicationInfo,
        analytics: AnalyticsAboutSendable,
        toolbarInteractive: ToolbarInteractive,
        networkResourceService: NetworkResourceService,
        deviceService: DeviceService,
        licenseService: LicenseService
    ) {
        self.appInfo = appInfo
        self.analytics = analytics
        self.toolbarInteractive = toolbarInteractive
        self.networkResourceService = networkResourceService
        self.deviceService = deviceService
        self.licenseService = licenseService
        self.currentYear = Date.now.formatted(.dateTime.year())
        self.appName = appInfo.name
        self.appVersion = appInfo.version
        self.appCompatibility = appInfo.compatibility
    }

    func onViewAppear() {
        fetchAppNetworkResources()
    }

    private func fetchAppNetworkResources() {
        appStorePreviewURL = try? networkResourceService.appStorePreviewURL()
        writeAppStoreReviewURL = try? networkResourceService.appStoreReviewURL()
        privacyPolicyURL = try? networkResourceService.privacyPolicyURL()
        weatherDataProviderURL = try? networkResourceService.weatherServiceURL()
    }

    func packagesLicense() -> URL {
        do {
            return try licenseService.content()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func doneItemTapped() {
        toolbarInteractive.doneItemTapped()
    }

    func reportFeedback(_ openURL: OpenURLAction) {
        guard let recipient = try? networkResourceService.supportEmail() else { return }

        let feedbackEmail = SupportEmail(
            body: emailBody,
            recipient: recipient,
            subject: "[Feedback] \(appInfo.name)"
        )
        feedbackEmail.send(openURL: openURL)
    }

    func reportIssue(_ openURL: OpenURLAction) {
        guard let recipient = try? networkResourceService.supportEmail() else { return }

        let bugEmail = SupportEmail(
            body: emailBody,
            recipient: recipient,
            subject: "[Bug] \(appInfo.name)"
        )
        bugEmail.send(openURL: openURL)
    }

    private var emailBody: SupportEmail.Body {
        SupportEmail.Body(
            appName: appInfo.name,
            appVersion: appInfo.version,
            deviceName: deviceService.deviceName(with: appInfo.deviceId),
            systemInfo: appInfo.system
        )
    }

    func shareURL() -> URL {
        do {
            return try networkResourceService.appStoreShareURL()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func sendEventRowTapped(_ title: String) {
        let event = AboutAnalyticsEvent.rowTapped(title: title)
        analytics.send(name: event.name, metadata: event.metadata)
    }

    func sendEventScreen(className: String) {
        let event = AboutAnalyticsEvent.screenViewed(className: className)
        analytics.send(name: event.name, metadata: event.metadata)
    }

}
