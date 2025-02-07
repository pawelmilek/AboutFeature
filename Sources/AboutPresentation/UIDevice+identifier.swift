//
//  UIDevice+identifier.swift
//  AboutFeature
//
//  Created by Pawel Milek on 2/7/25.
//

import UIKit

public extension UIDevice {
    var identifier: String {
        #if targetEnvironment(simulator)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
        var system = utsname()
        uname(&system)
        let machineMirror = Mirror(reflecting: system.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif

        return identifier
    }
}
