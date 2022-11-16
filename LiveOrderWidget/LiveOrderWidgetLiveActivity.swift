//
//  LiveOrderWidgetLiveActivity.swift
//  LiveOrderWidget
//
//  Created by Erik Flores on 14/11/22.
//

import WidgetKit
import SwiftUI

struct LiveOrderWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveOrderWidgetAttributes.self) { context in
            OrderView(orderStep: OrderStep(rawValue: context.state.step) ?? .started)
                .activityBackgroundTint(Color.cyan)
                .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center) {
                    OrderView(orderStep: OrderStep(rawValue: context.state.step) ?? .started)
                }
            } compactLeading: {
                Image(systemName: "bicycle")
            } compactTrailing: {
                Text("InProgress")
            } minimal: {
                Image(systemName: "bicycle")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
