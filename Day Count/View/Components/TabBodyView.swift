//
//  TabBodyView.swift
//  Day Count
//
//  Created by Dev on 1/11/2567 BE.
//

import SwiftUI

struct TabBodyView: View {
    @Binding var selectedTab: Int
    @ObservedObject var viewModel: MainContentViewModel
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<viewModel.dataTab.count, id: \.self) { index in
                viewModel.dataTab[index].view
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    TabBodyView(selectedTab: .constant(0), viewModel: MainContentViewModel(dataTab: []))
}
