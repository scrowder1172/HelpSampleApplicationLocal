//
// File: PersonFormModel.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import Foundation

@Observable
class PersonFormModel {
    var person: Person?
    var firstName: String = ""
    var lastName: String = ""
    var age: Int = 18
    
    var isUpdating: Bool {
        person != nil
    }
    
    init() {
        
    }
    
    init(person: Person) {
        self.person = person
        self.firstName = person.firstName
        self.lastName = person.lastName
        self.age = person.age
    }
}
