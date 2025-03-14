//
// File: HelpSampleApplicationLocalApp.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

@main
struct HelpSampleApplicationLocalApp: App {
    @State private var store = PeopleStore()
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            StartTab()
                .environment(store)
                .environment(appState)
        }
    }
}
