//
//  NetworkAppRepository.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public struct NetworkAppRepository: AppRepository {
    private let dataSource: AppDataSource

    public init(dataSource: AppDataSource) {
        self.dataSource = dataSource
    }

    public func resources() async throws -> [Resource] {
        try await dataSource.resources().resources
    }
}
