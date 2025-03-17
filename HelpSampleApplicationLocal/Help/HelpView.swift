//
// File: HelpView.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct HelpView: View {
    @Environment(\.dismiss) private var dismiss
    
    let title: String
    let pages: [HelpPage]
    
    @State private var scrollID: Int?
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.horizontal, showsIndicators:  false) {
                    HStack(spacing: 0) {
                        ForEach(0..<pages.count, id: \.self) { index in
                            let page = pages[index]
                            VStack {
                                if let image = page.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .clipped()
                                        .padding()
                                }
                                Text(page.title)
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                ScrollView {
                                    Text(page.text)
                                }
                                .contentMargins(15, for: .scrollContent)
                                Spacer()
                            }
                            .padding()
                            .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollPosition(id: $scrollID)
                .scrollTargetBehavior(.paging)
                HelpIndicatorView(pageCount: pages.count, scrollID: $scrollID)
                    .padding(.bottom)
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
        }
    }
}

#Preview {
    HelpView(title: HelpType.peopleList.title, pages: HelpType.peopleList.pages)
}
