//
// File: PeopleStore.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import Foundation

@Observable
class PeopleStore {
    var people: [Person] = []
    
    init() {
        let firstNames: [String] = ["John", "Emma", "Michael", "Sophia", "William", "Olivia", "James", "Ava", "Robert", "Isabella"]
        let lastNames: [String] = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez"]
        
        for _ in 1...50 {
            let firstName = firstNames.randomElement()!
            let lastName = lastNames.randomElement()!
            let age = Int.random(in: 1...80)
            people.append(Person(id: UUID(), firstName: firstName, lastName: lastName, age: age))
        }
        people.append(Person.sample)
    }
    
    func update(id: Person.ID, person: Person) {
        let personIndex = people.firstIndex(where: {$0.id == id })
        if let personIndex {
            people[personIndex].firstName = person.firstName
            people[personIndex].lastName = person.lastName
            people[personIndex].age = person.age
        }
    }
    
    func person(id: Person.ID?) -> Person? {
        guard let id else { return nil }
        return people.first(where: {$0.id == id})
    }
    
    func delete(person: Person) {
        let personIndex = people.firstIndex(where: {$0.id == person.id })
        if let personIndex {
            people.remove(at: personIndex)
        }
    }
}
