//
//  PackageLicenseRepository.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 12/24/23.
//  Copyright © 2023 Pawel Milek. All rights reserved.
//

import SwiftUI
import AboutFeatureDomain

public struct PackageLicenseRepository: LicenseRepository {
    private let dataSource: LicenseDataSource

    public init(dataSource: LicenseDataSource) {
        self.dataSource = dataSource
    }

    public func content() throws -> URL {
        try dataSource.content()
    }
}
