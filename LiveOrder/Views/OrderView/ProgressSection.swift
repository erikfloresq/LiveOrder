//
//  ProgressSection.swift
//  LiveOrder
//
//  Created by Erik Flores on 14/11/22.
//

import SwiftUI

struct ProgressSection: View {
    @Environment(\.isLuminanceReduced) var isLuminanceReduced
    @State var isActive: Bool

    var body: some View {
        VStack(spacing: 10) {
            if isActive {
                Image(systemName: "bicycle")
                    .resizable()
                    .frame(width: 40, height: 25)
            } else {
                Spacer().frame(height: 25)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(UIColor.systemGray4))
                    .frame(height: 10)
                if isActive {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemGreen))
                        .frame(height: 10)
                }
            }
        }

    }
}


struct ProgressSection_Previews: PreviewProvider {
    static var previews: some View {
        ProgressSection( isActive: true)
    }
}
