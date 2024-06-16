//
//  ContentView.swift
//  Clock
//
//  Created by Sam on 2024/6/16.
//

import SwiftUI

struct ContentView: View {
    @State private var center: CGPoint = .zero
    @State private var size: CGFloat = 0.0
    @State private var hourHandSize: CGFloat = 0.0
    @State private var minuteHandSize: CGFloat = 0.0
    @State private var secondHandSize: CGFloat = 0.0
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            // We must need the clear color to expand the whole screen for calculating current size to display center square
            Color.clear
                .ignoresSafeArea()
            
            Rectangle()
                .frame(width: size, height: size)
                .foregroundStyle(.blue)

            Group {
                HourHand()
                    .frame(maxWidth: hourHandSize)
                    .padding(.trailing, 5)
                    .position(center)
                // Prevent above modifiers effect animation
                    .animation(nil , value: isAnimating)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0), anchor: .center)
                    .animation(.linear(duration: 60.0/1.0).repeatForever(autoreverses: false), value: isAnimating)
                
                MinuteHand()
                    .frame(maxWidth: minuteHandSize)
                    .padding(.trailing, 5)
                    .position(center)
                // Prevent above modifiers effect animation
                    .animation(nil , value: isAnimating)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0), anchor: .center)
                    .animation(.linear(duration: 60.0/10.0).repeatForever(autoreverses: false), value: isAnimating)
                
                SecondHand()
                    .frame(width: secondHandSize)
                    .padding(.trailing, 20)
                    .position(center)
                // Prevent above modifiers effect animation
                    .animation(nil , value: isAnimating)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0), anchor: .center)
                    .animation(.linear(duration: 1.0).repeatForever(autoreverses: false), value: isAnimating)
            }
            .onAppear {
                isAnimating.toggle()
            }
            .rotationEffect(.degrees(270))

        }
        .background(
            GeometryReader { proxy in
                Color.clear
                    .onAppear {
                        size = min(proxy.size.width, proxy.size.height)
                        hourHandSize = (size * 0.5) - 5
                        minuteHandSize = (size * 0.5) - 5
                        secondHandSize = (size * 0.5) - 20
                        
                        center = CGPoint(x: proxy.frame(in: .local).midX + (size * 0.25),
                                         y: proxy.frame(in: .local).midY)
                    }
            }
        )
    }
}

#Preview {
    ContentView()
        .previewLayout(.sizeThatFits)
}
