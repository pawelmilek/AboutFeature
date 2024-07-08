//
//  LocalPackagesLicenseDataSource.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public struct LocalPackagesLicenseDataSource: LicenseDataSource {
    private let fileName: String
    private let fileExtension: String

    public init() {
        fileName = "packages_license"
        fileExtension = "html"
    }

    public func content() throws -> URL {
        guard let htmlURL = Bundle.module.url(
            forResource: fileName,
            withExtension: fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }
        return htmlURL
    }
}
