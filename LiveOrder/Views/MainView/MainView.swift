//
//  MainView.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            OrderView(orderStep: .started)
            OrderControls()
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
