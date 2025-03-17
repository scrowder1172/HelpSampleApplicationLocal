//
// File: HelpPage.swift
// Project: HelpSampleApplicationLocal
// 
// Created by SCOTT CROWDER on 3/14/25.
// 
// Copyright © Playful Logic Studios, LLC 2025. All rights reserved.
// 


import SwiftUI

struct HelpPage {
    let image: Image?
    let title: String
    let text: LocalizedStringKey
    
    init(image: Image? = nil, title: String, text: LocalizedStringKey) {
        self.image = image
        self.title = title
        self.text = text
    }
}
