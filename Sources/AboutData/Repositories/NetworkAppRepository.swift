//
//  NetworkAppRepository.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutDomain

public struct NetworkAppRepository: AppRepository {
    private let dataSource: AppDataSource
    private let decoder: JSONDecoder

    public init(dataSource: AppDataSource, decoder: JSONDecoder) {
        self.dataSource = dataSource
        self.decoder = decoder
    }

    public func resources() async throws -> [Resource] {
        let data = try await dataSource.resources()
        let appResources = try decoder.decode(AppResources.self, from: data)
        return appResources.resources
    }
}
