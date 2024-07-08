//
//  AppService.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public protocol AppService {
    func privacyPolicyURL() async throws -> URL
    func appStoreShareURL() async throws -> URL
    func appStoreReviewURL() async throws -> URL
    func appStorePreviewURL() async throws -> URL
    func dataProviderURL() async throws -> URL
    func supportEmail() async throws -> String
}
