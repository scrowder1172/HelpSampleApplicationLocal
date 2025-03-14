//
// File: StartTab.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct StartTab: View {
    @Environment(PeopleStore.self) var store
    @Environment(AppState.self) var appState
    
    var body: some View {
        TabView {
            Tab("People", systemImage: "person.3") {
                NavigationSplitView(columnVisibility: .constant(.doubleColumn)) {
                    PeopleListView()
                } detail: {
                    PersonDetail()
                }
                .navigationSplitViewStyle(.balanced)
            }
            Tab("Distribution", systemImage: "chart.bar") {
                DistributionView()
            }
        }
    }
}

#Preview {
    StartTab()
        .environment(PeopleStore())
        .environment(AppState())
}
