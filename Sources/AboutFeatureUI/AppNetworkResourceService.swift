//
//  AppNetworkResourceService.swift
//  AboutFeature
//
//  Created by Pawel Milek on 5/27/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation
import AboutFeatureDomain

public struct AppNetworkResourceService: NetworkResourceService {
    private enum Names {
        static let privacyPolicy = "privacyPolicy"
        static let appStoreShare = "appStoreShare"
        static let appStoreReview = "appStoreReview"
        static let appStorePreview = "appStorePreview"
        static let weatherService = "weatherService"
        static let supportEmail = "supportEmail"
    }

    private let repository: NetworkResourceRepository

    public init(repository: NetworkResourceRepository) {
        self.repository = repository
    }

    public func privacyPolicyURL() throws -> URL {
        try url(for: Names.privacyPolicy)
    }

    public func appStoreShareURL() throws -> URL {
        try url(for: Names.appStoreShare)
    }

    public func appStoreReviewURL() throws -> URL {
        try url(for: Names.appStoreReview)
    }

    public func appStorePreviewURL() throws -> URL {
        try url(for: Names.appStorePreview)
    }

    public func weatherServiceURL() throws -> URL {
        try url(for: Names.weatherService)
    }

    public func supportEmail() throws -> String {
        let resources = try repository.resources()

        if let email = resources.first(where: { $0.name == Names.supportEmail }) {
            return email.content
        } else {
            throw CocoaError(.featureUnsupported)
        }
    }

    private func url(for resrouceName: String) throws -> URL {
        let resources = try repository.resources()

        if let privacyPolicy = resources.first(where: { $0.name == resrouceName }),
           let url = URL(string: privacyPolicy.content) {
            return url
        } else {
            throw CocoaError(.featureUnsupported)
        }
    }
}
