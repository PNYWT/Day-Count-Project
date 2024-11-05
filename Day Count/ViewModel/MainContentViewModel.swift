//
//  MainContentViewModel.swift
//  Day Count
//
//  Created by Dev on 1/11/2567 BE.
//

import Foundation
import SwiftUI

class MainContentViewModel: ObservableObject {
    @Published var dataTab: [MainTabModel] = []
    
    init(dataTab: [MainTabModel]) {
        self.dataTab = dataTab
        self.dataTab = [
            .init(view: AnyView(EventView()), icon: Image(systemName: "calendar.badge.checkmark"),
                              title: "Event"),
            .init(view: AnyView(SettingView()), icon: Image(systemName: "gearshape"), title: "Setting")
        ]
    }
}
