//
//  LocalAppDataSource.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public struct LocalAppDataSource: AppDataSource {
    private let name: String
    private let fileExtension: String

    public init() {
        name = "app_resources"
        fileExtension = "json"
    }

    public func resources() async throws -> AppResources {
        let jsonData = try jsonData()
        let resources = try JSONDecoder().decode(AppResources.self, from: jsonData)
        return resources
    }

    private func jsonData() throws -> Data {
        do {
            let url = try fileURL()
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }

    private func fileURL() throws -> URL {
        guard let path = Bundle.module.url(
            forResource: name,
            withExtension: fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }

        return path
    }
}
