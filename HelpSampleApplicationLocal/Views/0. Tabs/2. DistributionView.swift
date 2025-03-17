//
// File: DistributionView.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 

import Charts
import SwiftUI

struct DistributionView: View {
    @Environment(PeopleStore.self) private var peopleStore
    @State private var help: HelpType?
    var ageDistribution: [(range: String, count: Int)] {
        let ranges = stride(from: 0, through: 80, by: 5).map { start in
            (start...(start + 4))
        }
        
        return ranges.map { range in
            let count = peopleStore.people.filter { range.contains($0.age) }.count
            return ("\(range.lowerBound)-\(range.upperBound)", count)
        }
    }
    
    var body: some View {
        NavigationStack {
            Chart {
                ForEach(ageDistribution, id: \.range) { item in
                    BarMark(
                        x: .value("Age Range", item.range),
                        y: .value("Count", item.count)
                    )
                }
            }
            .chartXAxis {
                AxisMarks(values: .automatic) { value in
                    AxisValueLabel {
                        if let label = value.as(String.self) {
                            Text(label)
                                .rotationEffect(.degrees(-45))
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Age Distribution")
        }
        .helpButton(currentHelp: .distribution, help: $help)
    }
}

#Preview {
    DistributionView()
        .environment(PeopleStore())
}
