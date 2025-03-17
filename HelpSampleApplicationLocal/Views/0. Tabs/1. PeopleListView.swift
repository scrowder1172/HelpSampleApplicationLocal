//
// File: PeopleListView.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct PeopleListView: View {
    @Environment(PeopleStore.self) var store
    @Environment(AppState.self) var appState
    
    @State private var formType: PersonFormType?
    @State private var showSettings: Bool = false
    @State private var help: HelpType?
    var body: some View {
        List(store.people, selection: Bindable(appState).selectedPerson) { person in
            PersonRowView(person: person).tag(person)
                .swipeActions {
                    Button(role: .destructive) {
                        store.delete(person: person)
                    } label: {
                        Image(systemName: "trash")
                    }
                }
        }
        .listStyle(.plain)
        .navigationTitle("People")
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gear")
                }
                
                Button {
                    formType = .new
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
        .sheet(item: $formType) { $0 }
        .sheet(isPresented: $showSettings) {
            SettingsView()
        }
        .helpButton(currentHelp: .peopleList, help: $help, bgColor: .orange, symbol: .lightbulb)
    }
}

#Preview {
    NavigationStack{
        PeopleListView()
    }
        .environment(PeopleStore())
        .environment(AppState())
}

struct PersonRowView: View {
    let person: Person
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(person.firstName) \(person.lastName)")
                .font(.headline)
            Text("Age: \(person.age)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}
