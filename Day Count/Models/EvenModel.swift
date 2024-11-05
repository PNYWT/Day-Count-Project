//
//  EvenModel.swift
//  Day Count
//
//  Created by Dev on 5/11/2567 BE.
//

import Foundation

struct EventSection: Identifiable {
    let id = UUID()
    let header: String
    let items: [EventItem]
}

struct EventItem: Hashable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
}
