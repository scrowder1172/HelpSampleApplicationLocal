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
    let currentHelp: [HelpType]
    
    @Binding var help: HelpType?
    
    let bgColor: Color
    let symbol: String
    
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                Group{
                    if !currentHelp.isEmpty{
                        if currentHelp.count == 1 {
                            Button {
                                help = currentHelp.first
                            } label: {
                                buttonLabel
                            }
                        } else {
                            Menu {
                                ForEach(currentHelp, id: \.self) { helpType in
                                    Button(helpType.title) {
                                        help = helpType
                                    }
                                }
                            } label: {
                                buttonLabel
                            }

                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .padding(.trailing)
            }
            .sheet(item: $help) { help in
                help
            }
    }
    
    var buttonLabel: some View {
        Image(systemName: symbol)
            .fontDesign(.rounded)
            .foregroundStyle(.white)
            .bold()
            .padding()
            .background(bgColor, in: .circle)
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

enum ButtonSymbol: String {
    case questionmark, info, exclamationmark
    case lightbulb = "lightbulb.fill"
}

extension View {
    func helpButton(
        currentHelp: HelpType...,
        help: Binding<HelpType?>,
        bgColor: Color = .green,
        symbol: ButtonSymbol = .questionmark
    ) -> some View {
        modifier(
            HelpButtonModifier(
                currentHelp: currentHelp,
                help: help,
                bgColor: bgColor,
                symbol: symbol.rawValue
            )
        )
    }
}
