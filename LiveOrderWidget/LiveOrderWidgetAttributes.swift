//
//  LiveOrderWidgetAttributes.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import Foundation
import ActivityKit

struct LiveOrderWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var step: String
    }

    // Fixed non-changing properties about your activity go here!
    var restaurant: String
}
