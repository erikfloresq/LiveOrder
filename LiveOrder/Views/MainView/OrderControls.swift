//
//  OrderControls.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import SwiftUI

struct OrderControls: View {
    let activityManager = ActivityManager()

    var body: some View {
        HStack {
            ControlButton("Start") {
                activityManager.request()
            }
            ControlButton("Update") {
                activityManager.update()
            }
            ControlButton("End") {
                activityManager.end()
            }
        }
    }
}

struct OrderControls_Previews: PreviewProvider {
    static var previews: some View {
        OrderControls()
    }
}
