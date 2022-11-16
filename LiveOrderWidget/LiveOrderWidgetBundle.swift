//
//  LiveOrderWidgetBundle.swift
//  LiveOrderWidget
//
//  Created by Erik Flores on 14/11/22.
//

import WidgetKit
import SwiftUI

@main
struct LiveOrderWidgetBundle: WidgetBundle {
    var body: some Widget {
        LiveOrderWidget()
        LiveOrderWidgetLiveActivity()
    }
}
