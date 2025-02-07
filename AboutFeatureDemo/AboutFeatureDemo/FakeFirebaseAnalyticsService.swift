//
//  FakeFirebaseAnalyticsService.swift
//  AboutFeatureDemo
//
//  Created by Pawel Milek on 2/7/25.
//

protocol AnalyticsService: AnyObject {
    func send(event: AnalyticsEvent)
}

protocol AnalyticsEvent {
    var name: String { get }
    var metadata: [String: Any] { get }
}

class FakeFirebaseAnalyticsService: AnalyticsService {
    func send(event: AnalyticsEvent) { }
}
