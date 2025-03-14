//
// File: PersonFormView.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct PersonFormView: View {
    @Environment(PeopleStore.self) var store
    @Environment(AppState.self) var appState
    @Environment(\.dismiss) private var dismiss
    
    @State var model: PersonFormModel
    
    var body: some View {
        Form {
            Section("Personal Information") {
                TextField("First Name", text: $model.firstName)
                TextField("Last Name", text: $model.lastName)
                Stepper("Age: \(model.age)", value: $model.age, in: 0...120)
            }
        }
        .navigationTitle(model.person == nil ? "Add Person" : "")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    model.person?.firstName = model.firstName
                    model.person?.lastName = model.lastName
                    model.person?.age = model.age
                    if let person = model.person {
                        store.update(id: person.id, person: person)
                    } else {
                        let newPerson = Person(id: UUID(), firstName: model.firstName, lastName: model.lastName, age: model.age)
                        store.people.append(newPerson)
                    }
                    dismiss()
                }
                .disabled(model.firstName.isEmpty || model.lastName.isEmpty)
            }
        }
        .inNavStack(inNavigation: !model.isUpdating)
    }
}

#Preview {
    NavigationStack{
        PersonFormView(model: PersonFormModel(person: Person.sample))
    }
    .environment(PeopleStore())
    .environment(AppState())
}

struct InNavStack: ViewModifier {
    var inNavigation: Bool
    func body(content: Content) -> some View {
        if inNavigation {
            NavigationStack {
                content
            }
        } else {
                content
        }
    }
}

extension View {
    func inNavStack(inNavigation: Bool) -> some View {
        modifier(InNavStack(inNavigation: inNavigation))
    }
}
