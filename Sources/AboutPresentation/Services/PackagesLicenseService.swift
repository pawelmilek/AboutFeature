//
//  PackagesLicenseService.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutDomain

public struct PackagesLicenseService: LicenseService {
    private let repository: LicenseRepository

    public init(repository: LicenseRepository) {
        self.repository = repository
    }

    public func content() async throws -> String {
        try await repository.content()
    }
}
