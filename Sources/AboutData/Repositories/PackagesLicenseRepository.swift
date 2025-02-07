//
//  PackagesLicenseRepository.swift
//  AboutFeature
//
//  Created by Pawel Milek on 12/24/23.
//  Copyright © 2023 Pawel Milek. All rights reserved.
//

import AboutDomain

public struct PackagesLicenseRepository: LicenseRepository {
    private let dataSource: LicenseDataSource

    public init(dataSource: LicenseDataSource) {
        self.dataSource = dataSource
    }

    public func content() async throws -> String {
        try await dataSource.content()
    }
}
