//
//  LocalLicenseDataSource.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct LocalLicenseDataSource: LicenseDataSource {
    private let licenseFile: LocalFileResource

    public init(licenseFile: LocalFileResource) {
        self.licenseFile = licenseFile
    }

    public func content() async throws -> String {
        guard let url = licenseFile.bundle.url(
            forResource: licenseFile.name,
            withExtension: licenseFile.fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }

        return try String(contentsOf: url)
    }
}
