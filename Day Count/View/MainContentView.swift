//
//  MainContentView.swift
//  Day Count
//
//  Created by Dev on 31/10/2567 BE.
//

import SwiftUI

struct MainContentView: View {
    
    @State private var selectedTab: Int = 0
    @StateObject private var viewModel = MainContentViewModel(dataTab: [])
    
    @State private var isAdd: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                VStack(spacing: 0) {
                    // Tabs Header
                    TabHeaderView(tabs: viewModel.dataTab, geoWidth: geo.size.width, selectedTab: $selectedTab)
                        .background(Color.primaryBackground)
                    
                    // Tabs Body
                    TabBodyView(selectedTab: $selectedTab, viewModel: viewModel)
                        .background(content: {
                            LinearGradient(
                                colors: [
                                    .white,
                                    Color.primaryButtonColor,
                                    Color.secondaryButtonColor
                                ],
                                startPoint: .top,
                                endPoint: .bottom)
                        })
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Cay Count")
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
                
                // Button Add
                ZStack(alignment: .trailing) {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                isAdd.toggle()
                            }, label: {
                                if selectedTab == viewModel.dataTab.startIndex {
                                    CustomPlusButtonView()
                                }
                            })
                            .padding()
                        }
                        .background(
                            NavigationLink(
                                destination: SettingView(),
                                isActive: $isAdd
                            ) {
                                EmptyView()
                            }
                        )
                    }
                }
            }
        }
        .tint(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
