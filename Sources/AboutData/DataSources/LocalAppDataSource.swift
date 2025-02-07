//
//  LocalAppDataSource.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutDomain

public struct LocalAppDataSource: AppDataSource {
    private let localFileResource: LocalFileResource

    public init(
        localFileResource: LocalFileResource
    ) {
        self.localFileResource = localFileResource
    }

    public func resources() async throws -> Data {
        let url = try fileURL()
        return try Data(contentsOf: url)
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
