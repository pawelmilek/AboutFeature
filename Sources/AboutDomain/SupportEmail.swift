//
//  SupportEmail.swift
//  AboutFeature
//
//  Created by Pawel Milek on 12/24/23.
//  Copyright © 2023 Pawel Milek. All rights reserved.
//

import Foundation

public struct SupportEmail {
    public struct Body {
        let appName: String
        let appVersion: String
        let deviceName: String
        let systemInfo: String

        public init(
            appName: String,
            appVersion: String,
            deviceName: String,
            systemInfo: String
        ) {
            self.appName = appName
            self.appVersion = appVersion
            self.deviceName = deviceName
            self.systemInfo = systemInfo
        }
    }

    private let body: Body
    private let recipient: String
    private let subject: String

    public init(body: Body, recipient: String, subject: String) {
        self.body = body
        self.recipient = recipient
        self.subject = subject
    }

    public var mailToURL: URL? {
        let replacedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let replacedBody = bodyContent.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let urlString = "mailto:\(recipient)?subject=\(replacedSubject)&body=\(replacedBody)"
        let url = URL(string: urlString)
        return url
    }

    private var bodyContent: String {
      """
        Application: \(body.appName)
        Version: \(body.appVersion)
        Device: \(body.deviceName)
        \(body.systemInfo)

        Please provide your feedback below.
        ------------------------------------

      """
    }
}
