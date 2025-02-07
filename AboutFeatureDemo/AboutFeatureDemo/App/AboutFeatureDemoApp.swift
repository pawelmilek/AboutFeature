//
//  AboutFeatureDemoApp.swift
//  AboutFeatureDemo
//
//  Created by Pawel Milek on 2/7/25.
//

import SwiftUI
import Presentation
import Domain
import Data

@main
struct AboutFeatureDemoApp: App {
    @StateObject private var viewModel = AboutViewModel(
        appInfo: BundledApplicationInfo(bundle: .main, currentDevice: .current),
        analytics: FirebaseAnalyticsAboutAdapter(),
        toolbarInteractive: ThemeTipToolbarAdapter(),
        appService: NetworkAppService(
            repository: NetworkAppRepository(
                dataSource: LocalAppDataSource(
                    localFileResource: LocalFileResource(
                        name: "app_resources",
                        fileExtension: "json",
                        bundle: .main
                    )
                ),
                decoder: JSONDecoder()
            )
        ),
        deviceService: UserDeviceService(
            repository: ReleasedDevicesRepository(
                dataSource: LocalDevicesDataSource(),
                decoder: JSONDecoder()
            )
        ),
        licenseService: PackagesLicenseService(
            repository: PackagesLicenseRepository(
                dataSource: LocalLicenseDataSource(
                    licenseFile: LocalFileResource(
                        name: "packages_license",
                        fileExtension: "html",
                        bundle: .main
                    )
                )
            )
        )
    )
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }

}
