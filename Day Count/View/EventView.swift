//
//  EventView.swift
//  Day Count
//
//  Created by Dev on 1/11/2567 BE.
//

import SwiftUI

struct EventView: View {
    
    private let sections: [EventSection] = [
        EventSection(header: "หมวดหมู่ 1", items: [
            EventItem(title: "Item 1-1", description: "Description for item 1-1"),
            EventItem(title: "Item 1-2", description: "Description for item 1-2"),
            EventItem(title: "Item 1-3", description: "Description for item 1-3"),
            EventItem(title: "Item 1-4", description: "Description for item 1-4"),
            EventItem(title: "Item 1-5", description: "Description for item 1-5"),
            EventItem(title: "Item 1-6", description: "Description for item 1-6"),
            EventItem(title: "Item 1-7", description: "Description for item 1-7")
        ])
    ]
    
    @State private var singleSelection: UUID?
    @State var isOpen: Bool = false
    
    @State private var fadeInOut: Bool = false
    @State private var animateOffset: Bool = false
    @State private var hasAnimated = false
    
    var body: some View {
        GeometryReader { geoMain in
            ScrollView(.vertical) {
                LazyVStack(alignment: .center) {
                    ForEach(sections) { itemSection in
                        Section(header: headerView) {
                            ForEach(Array(itemSection.items.enumerated()), id: \.element.id) { index, itemRow in
                                GeometryReader { geo in
                                    CardEventView(onOpen: {
                                        isOpen.toggle()
                                    })
                                    .padding(.horizontal)
                                    .listRowSeparator(.hidden)
                                    .scaleEffect(dimesionValue(firstFrame: geoMain.frame(in: .global).minY, minY: geo.frame(in: .global).minY))
                                    .opacity(Double(dimesionValue(firstFrame: geoMain.frame(in: .global).minY, minY: geo.frame(in: .global).minY)))
                                    .onAppear {
                                        animationAppear()
                                    }
                                    .opacity(fadeInOut ? 1 : 0)
                                    .offset(x: animateOffset ? (index % 2 == 0 ? geo.size.width : -geo.size.width) : 0)
                                }
                                .frame(height: 100)
                            }
                        }
                    }
                }
                .background(
                    NavigationLink(
                        destination: SettingView(),
                        isActive: $isOpen
                    ) {
                        EmptyView()
                    }
                )
            }
        }
    }
    
    private func animationAppear() {
        if hasAnimated {
            return
        }
        animateOffset.toggle()
        withAnimation(.interactiveSpring(duration: 2.0)) {
            animateOffset.toggle()
            fadeInOut.toggle()
        }
        hasAnimated = true
    }
    
    private var headerView: some View {
        HStack {
            Spacer()
            Button(action: shareAction) {
                HStack {
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .foregroundStyle(Color.primaryText)
                    Text("Share")
                        .foregroundStyle(Color.primaryText)
                }
                .foregroundColor(.blue)
            }
            Spacer()
        }
        .frame(height: 50)
    }
    
    private func shareAction() {
        print("Share button tapped")
        let url = URL(string: "https://google.com")
        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let rootViewController = windowScene.windows.first?.rootViewController {
            rootViewController.present(activityController, animated: true, completion: nil)
        }
    }
    
    private func dimesionValue(firstFrame: CGFloat, minY: CGFloat) -> CGFloat {
        withAnimation(.easeIn(duration: 1.0)) {
            let dimension = (minY - 15) / firstFrame
            if dimension > 1 {
                return 1
            } else {
                return dimension
            }
        }
    }
}

#Preview {
    EventView()
}
