//
//  SecondHand.swift
//  Clock
//
//  Created by Sam on 2024/6/16.
//

import SwiftUI

struct SecondHand: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundStyle(.red)
            .frame(maxHeight: 2.5)
        
    }
}

#Preview {
    SecondHand()
}
