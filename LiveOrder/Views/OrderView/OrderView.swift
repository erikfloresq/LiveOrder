//
//  OrderView.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import SwiftUI

struct OrderView: View {
    let orderStep: OrderStep

    var body: some View {
        VStack(spacing: 10) {
            Text("Order in progress")
            ProgressBar(orderStep: orderStep)
        }
        .padding()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orderStep: .started)
    }
}
