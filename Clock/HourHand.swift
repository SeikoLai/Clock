//
//  HourHand.swift
//  Clock
//
//  Created by Sam on 2024/6/16.
//

import SwiftUI

struct HourHand: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.black)
            .frame(maxHeight: 5.0)
    }
}

#Preview {
    HourHand()
}
