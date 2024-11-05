//
//  SettingViewModel.swift
//  Day Count
//
//  Created by Dev on 5/11/2567 BE.
//

import Foundation

class SettingViewModel: ObservableObject {
    @Published var dataList: [SettingListModel] = []
    
    init(dataList: [SettingListModel]) {
        self.dataList = dataList
        
        self.dataList = [
            .init(type: .notification),
            .init(type: .language),
            .init(type: .reviewUs),
            .init(type: .policy),
            .init(type: .termUse),
        ]
    }
}
