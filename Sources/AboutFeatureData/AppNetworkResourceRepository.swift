//
//  AppNetworkResourceRepository.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public struct AppNetworkResourceRepository: NetworkResourceRepository {
    private let dataSource: NetworkResourceDataSource

    public init(dataSource: NetworkResourceDataSource) {
        self.dataSource = dataSource
    }

    public func resources() throws -> [Resource] {
        try dataSource.resources().resources
    }
}
