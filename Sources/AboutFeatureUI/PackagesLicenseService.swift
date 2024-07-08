//
//  File.swift
//  
//
//  Created by Pawel Milek on 7/7/24.
//

import Foundation
import AboutFeatureDomain

public struct PackagesLicenseService: LicenseService {
    private let repository: LicenseRepository

    public init(repository: LicenseRepository) {
        self.repository = repository
    }

    public func content() throws -> URL {
        try repository.content()
    }
}
