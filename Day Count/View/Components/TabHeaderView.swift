//
//  TabHeaderView.swift
//  Day Count
//
//  Created by Dev on 31/10/2567 BE.
//

import Foundation
import SwiftUI

struct TabHeaderView: View {
    var fixed = true
    var tabs: [MainTabModel]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                TextTabsView(tabs: tabs, row: row, geoWidth: geoWidth, selectedTab: $selectedTab, fixed: fixed)
                            })
                            .accentColor(Color.white)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .onChange(of: selectedTab) { newValue in
                        withAnimation {
                            proxy.scrollTo(newValue)
                        }
                    }
                }
            }
        }
        .frame(height: 55)
        .onAppear(perform: {
            UIScrollView.appearance().backgroundColor = UIColor.clear
            UIScrollView.appearance().bounces = fixed ? false : true
        })
        .onDisappear(perform: {
            UIScrollView.appearance().bounces = true
        })
    }
}

#Preview {
    VStack {
        TabHeaderView(fixed: true,
                    tabs: [.init(view: AnyView(EventView()), icon: Image(systemName: "calendar.badge.checkmark"), title: "Event"),
                           .init(view: AnyView(SettingView()), icon: Image(systemName: "ellipsis"), title: "Other")
           ],
                    geoWidth: 375,
                    selectedTab: .constant(0))
    }
    .background(Color.primaryBackground)
}

struct TextTabsView: View {
    var tabs: [MainTabModel]
    var row: Int
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    var fixed: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack {
                    // Image
                    AnyView(tabs[row].icon)
                        .foregroundColor(.primaryText)
                        .frame(height: 20)
                    
                    // Text
                    Text(tabs[row].title)
                        .font(Font.system(size: 12, weight: .semibold))
                        .foregroundColor(Color.primaryText)
                }
            }
            .frame(width: fixed ? ((geoWidth - 16) / CGFloat(tabs.count)) : .none, height: 52)
            // Bar Indicator
            Rectangle().fill(selectedTab == row ? Color.divider : Color.clear)
                .frame(height: 3)
                .frame(width: 100)
        }.fixedSize()
    }
}
