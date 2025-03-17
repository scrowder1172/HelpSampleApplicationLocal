//
// File: HelpIndicatorView.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct HelpIndicatorView: View {
    let pageCount: Int
    
    @Binding var scrollID: Int?
    
    var body: some View {
        if pageCount > 1 {
            HStack {
                ForEach(0..<pageCount, id: \.self) { index in
                    let current = scrollID ?? 0
                    Button {
                        withAnimation {
                            scrollID = index
                        }
                    } label: {
                        Image(systemName: "circle.fill")
                            .font(.system(size: index == current ? 12 : 8))
                            .foregroundStyle(index == current ? Color(.lightGray) : .white)
                    }
                }
            }
            .animation(.easeInOut, value: scrollID)
            .padding(7)
            .background(
                Color(.lightGray).opacity(0.2), in: RoundedRectangle(cornerRadius: 10)
            )
        }
    }
}

#Preview {
    HelpIndicatorView(pageCount: 3, scrollID: .constant(2))
}
