//
// File: Person.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import Foundation

struct Person: Identifiable, Hashable {
    var id: UUID
    var firstName: String
    var lastName: String
    var age: Int
    
    static var sample: Person = Person(
        id: Self.sampleID,
        firstName: "Stewart",
        lastName: "Lynch",
        age: 73
    )
    
    static var sampleID: UUID = UUID(
        uuidString: "5d6fe059-70b7-49fc-a5e5-4bbc259b2cc5")!
}
