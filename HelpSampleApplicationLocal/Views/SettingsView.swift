//
// File: SettingsView.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var help: HelpType?
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text("Update Settings")
                Spacer()
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                }
            }
        }
        .helpButton(currentHelp: .settings, help: $help)
    }
}

#Preview {
    SettingsView()
}
