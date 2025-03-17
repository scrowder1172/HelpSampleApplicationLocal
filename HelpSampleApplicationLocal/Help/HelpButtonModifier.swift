//
// File: HelpButtonModifier.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct HelpButtonModifier: ViewModifier {
    let currentHelp: HelpType
    
    @Binding var help: HelpType?
    
    let bgColor: Color
    let symbol: String
    
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                Button {
                    help = currentHelp
                } label: {
                    Image(systemName: symbol)
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                        .background(bgColor, in: .circle)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .padding(.trailing)
            }
            .sheet(item: $help) { help in
                help
            }
    }
}

enum ButtonSymbol: String {
    case questionmark, info, exclamationmark
    case lightbulb = "lightbulb.fill"
}

extension View {
    func helpButton(
        currentHelp: HelpType,
        help: Binding<HelpType?>,
        bgColor: Color = .green,
        symbol: ButtonSymbol = .questionmark
    ) -> some View {
        modifier(HelpButtonModifier(currentHelp: currentHelp, help: help, bgColor: bgColor, symbol: symbol.rawValue))
    }
}
