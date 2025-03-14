//
// File: PersonDetail.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct PersonDetail: View {
    @Environment(AppState.self) private var appState
    
    var body: some View {
        Group {
            if appState.selectedPerson == nil {
                ContentUnavailableView("Select a Person", systemImage: "person")
            } else {
                PersonFormType.update(appState.selectedPerson!)
                    .id(appState.selectedPerson)
            }
        }
    }
}

#Preview {
    PersonDetail()
        .environment(AppState())
}
