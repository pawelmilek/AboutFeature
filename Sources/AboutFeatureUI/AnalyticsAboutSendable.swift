//
//  AnalyticsAboutSendable.swift
//  AboutFeature
//
//  Created by Pawel Milek on 7/3/24.
//  Copyright © 2024 Pawel Milek. All rights reserved.
//

public protocol AnalyticsAboutSendable {
    func send(name: String, metadata: [String: Any])
}
