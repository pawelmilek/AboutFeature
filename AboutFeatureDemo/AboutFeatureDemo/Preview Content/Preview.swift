//
//  Preview.swift
//  AboutFeatureDemo
//
//  Created by Pawel Milek on 2/7/25.
//

import Foundation
import AboutPresentation
import AboutDomain
import AboutData

@MainActor
enum Preview {
    static var viewModel: AboutViewModel {
        AboutViewModel(
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
    }
}

