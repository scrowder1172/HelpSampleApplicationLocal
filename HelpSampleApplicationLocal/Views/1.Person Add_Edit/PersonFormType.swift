//
// File: PersonFormType.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

enum PersonFormType: Identifiable, View {
    case new
    case update(Person)
    
    var id: String {
        String(describing: self)
    }
    
    var body: some View {
        switch self {
        case .new:
            PersonFormView(model: PersonFormModel())
        case .update(let person):
            PersonFormView(model: PersonFormModel(person: person))
        }
    }
}
