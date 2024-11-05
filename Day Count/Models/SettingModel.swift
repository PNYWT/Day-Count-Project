//
//  SettingModel.swift
//  Day Count
//
//  Created by Dev on 5/11/2567 BE.
//

import Foundation

enum SettingType: String, CaseIterable {
    case notification = "Notification"
    case language = "Language"
    case reviewUs = "Rate Us / Feedback"
    case policy = "Policy"
    case termUse = "Terms of Use"
    
    var icon: String {
        switch self {
        case .notification:
            return "bell.badge"
        case .language:
            return "globe"
        case .reviewUs:
            return "star.circle"
        case .policy:
            return ""
        case .termUse:
            return ""
        }
    }
}

struct SettingListModel: Identifiable {
    let id = UUID()
    let type: SettingType
}
