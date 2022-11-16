//
//  ProgressBar.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import SwiftUI

struct ProgressBar: View {
    let orderStep: OrderStep

    var body: some View {
        HStack(spacing: 10) {
            ProgressSection(isActive: orderStep == .started)
            ProgressSection(isActive: orderStep == .inProgress)
            ProgressSection(isActive: orderStep == .completed)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(orderStep: .started)
    }
}

