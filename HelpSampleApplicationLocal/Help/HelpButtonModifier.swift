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
    
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                Button {
                    help = currentHelp
                } label: {
                    Image(systemName: "questionmark")
                        .fontDesign(.rounded)
                        .foregroundStyle(.white)
                        .bold()
                        .padding()
                        .background(.green, in: .circle)
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

extension View {
    func helpButton(currentHelp: HelpType, help: Binding<HelpType?>) -> some View {
        modifier(HelpButtonModifier(currentHelp: currentHelp, help: help))
    }
}
