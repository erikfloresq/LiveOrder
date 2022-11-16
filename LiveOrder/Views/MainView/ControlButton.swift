//
//  ControlButton.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import SwiftUI

struct ControlButton: View {
    let label: String
    let action: () -> Void

    init(_ label: String, action: @escaping () -> Void) {
        self.label = label
        self.action = action
    }

    var body: some View {
        Button {
            action()
        } label: {
            Text(label)
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ControlButton_Previews: PreviewProvider {
    static var previews: some View {
        ControlButton("Start", action: {})
    }
}
