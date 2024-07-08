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
    private let localFileResource: LocalFileResource
    private let decoder: JSONDecoder

    public init(localFileResource: LocalFileResource, decoder: JSONDecoder) {
        self.localFileResource = localFileResource
        self.decoder = decoder
    }

    public func resources() async throws -> AppResources {
        let jsonData = try jsonData()
        let resources = try decoder.decode(AppResources.self, from: jsonData)
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
        guard let path = localFileResource.bundle.url(
            forResource: localFileResource.name,
            withExtension: localFileResource.fileExtension
        ) else {
            throw CocoaError(.fileNoSuchFile)
        }

        return path
    }
}
