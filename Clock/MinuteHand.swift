//
//  MinuteHand.swift
//  Clock
//
//  Created by Sam on 2024/6/16.
//

import SwiftUI

struct MinuteHand: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundColor(.yellow)
            .frame(maxHeight: 5.0)
    }
}

#Preview {
    MinuteHand()
}
