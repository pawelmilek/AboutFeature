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
    @Published private(set) var packagesLicenseContent = ""
    @Published private(set) var appStoreShareURL: URL?
    @Published private(set) var appStorePreviewURL: URL?
    @Published private(set) var writeAppStoreReviewURL: URL?
    @Published private(set) var privacyPolicyURL: URL?
    @Published private(set) var dataProviderURL: URL?
    @Published private(set) var currentYear = ""
    private let appInfo: ApplicationInfo
    private let analytics: AnalyticsAboutSendable
    private let toolbarInteractive: ToolbarInteractive
    private let appService: AppService
    private let deviceService: DeviceService
    private let licenseService: LicenseService

    public init(
        appInfo: ApplicationInfo,
        analytics: AnalyticsAboutSendable,
        toolbarInteractive: ToolbarInteractive,
        appService: AppService,
        deviceService: DeviceService,
        licenseService: LicenseService
    ) {
        self.appInfo = appInfo
        self.analytics = analytics
        self.toolbarInteractive = toolbarInteractive
        self.appService = appService
        self.deviceService = deviceService
        self.licenseService = licenseService
        self.currentYear = Date.now.formatted(.dateTime.year())
        self.appName = appInfo.name
        self.appVersion = appInfo.version
        self.appCompatibility = appInfo.compatibility
    }

    func onViewAppear() {
        fetchAppNetworkResources()
        fetchPackagesLicense()
    }

    private func fetchAppNetworkResources() {
        Task {
            async let appStorePreviewURL = appService.appStorePreviewURL()
            async let writeAppStoreReviewURL = appService.appStoreReviewURL()
            async let privacyPolicyURL = appService.privacyPolicyURL()
            async let dataProviderURL = appService.dataProviderURL()
            async let appStoreShareURL = appService.appStoreShareURL()

            self.appStorePreviewURL = try? await appStorePreviewURL
            self.writeAppStoreReviewURL = try? await writeAppStoreReviewURL
            self.privacyPolicyURL = try? await privacyPolicyURL
            self.dataProviderURL = try? await dataProviderURL
            self.appStoreShareURL = try? await appStoreShareURL
        }
    }

    func fetchPackagesLicense() {
        Task {
            do {
                packagesLicenseContent = try await licenseService.content()
            } catch {
                fatalError(error.localizedDescription)
            }
        }
    }

    func doneItemTapped() {
        toolbarInteractive.doneItemTapped()
    }

    func report(subject: String, _ openURL: OpenURLAction) {
        Task {
            do {
                async let recipient = appService.supportEmail()
                async let deviceName = deviceService.deviceName(with: appInfo.deviceId)
                let result = try await (recipient, deviceName)

                let feedbackEmail = SupportEmail(
                    body: SupportEmail.Body(
                        appName: appInfo.name,
                        appVersion: appInfo.version,
                        deviceName: result.1,
                        systemInfo: appInfo.system
                    ),
                    recipient: result.0,
                    subject: "\(subject) \(appInfo.name)"
                )
                feedbackEmail.send(openURL: openURL)

            } catch {
                fatalError(error.localizedDescription)
            }
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
