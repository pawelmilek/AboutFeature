//
//  LocalPackagesLicenseDataSource.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct LocalPackagesLicenseDataSource: LicenseDataSource {
    private let licenseFile: LicenseFile
    private let bundle: Bundle

    public init(licenseFile: LicenseFile, bundle: Bundle) {
        self.licenseFile = licenseFile
        self.bundle = bundle
    }

    public func content() async throws -> String {
        guard let url = bundle.url(
            forResource: licenseFile.name,
            withExtension: licenseFile.fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }

        return try String(contentsOf: url)
    }
}
