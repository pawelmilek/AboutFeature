//
//  NetworkResourceService.swift
//  Swifty Forecast
//
//  Created by Pawel Milek on 7/7/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

import Foundation

public protocol NetworkResourceService {
    func privacyPolicyURL() throws -> URL
    func appStoreShareURL() throws -> URL
    func appStoreReviewURL() throws -> URL
    func appStorePreviewURL() throws -> URL
    func weatherServiceURL() throws -> URL
    func supportEmail() throws -> String
}
