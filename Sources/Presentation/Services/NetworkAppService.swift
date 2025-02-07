//
//  NetworkAppService.swift
//  AboutFeature
//
//  Created by Pawel Milek on 5/27/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import Domain

public struct NetworkAppService: AppService {
    private enum Names {
        static let privacyPolicy = "privacyPolicy"
        static let appStoreShare = "appStoreShare"
        static let appStoreReview = "appStoreReview"
        static let appStorePreview = "appStorePreview"
        static let dataProvider = "dataProvider"
        static let supportEmail = "supportEmail"
    }

    private let repository: AppRepository

    public init(repository: AppRepository) {
        self.repository = repository
    }

    public func privacyPolicyURL() async throws -> URL {
        try await url(for: Names.privacyPolicy)
    }

    public func appStoreShareURL() async throws -> URL {
        try await url(for: Names.appStoreShare)
    }

    public func appStoreReviewURL() async throws -> URL {
        try await url(for: Names.appStoreReview)
    }

    public func appStorePreviewURL() async throws -> URL {
        try await url(for: Names.appStorePreview)
    }

    public func dataProviderURL() async throws -> URL {
        try await url(for: Names.dataProvider)
    }

    public func supportEmail() async throws -> String {
        try await resource(with: Names.supportEmail).content
    }

    private func url(for resrouceName: String) async throws -> URL {
        if let privacyPolicy = try? await resource(with: resrouceName),
           let url = URL(string: privacyPolicy.content) {
            return url
        } else {
            throw CocoaError(.featureUnsupported)
        }
    }

    private func resource(with name: String) async throws -> Resource {
        guard let resource = try await repository.resources().first(where: { $0.name == name }) else {
            throw CocoaError(.coderInvalidValue)
        }
        return resource
    }
}
