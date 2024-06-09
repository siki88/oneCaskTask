//
//  BottomTabBar.swift
//  OneCask
//
//  Created by Lukáš Spurný on 09.06.2024.
//

import SwiftUI

enum Tab: CaseIterable {
    case scan, collection, shop, settings
    
    var title: String {
        switch self {
        case .scan: "Scan"
        case .collection: "Collection"
        case .shop: "Shop"
        case .settings: "Settings"
        }
    }
    
    // tudu impl select and unselect icon
}

struct TabBarItem: View {
    let tabType: Tab
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                // tudu impl select and unselect icon
                Image(isSelected ? "emptyTabIcon" : "emptyTabIcon")
                Label(
                    text: tabType.title,
                    fontSize: 12,
                    color: isSelected ? .white : Color("tabGrayColor"),
                    alignment: .center,
                    maxWidth: nil
                )
            }
        }
        .foregroundColor(isSelected ? .white : .gray)
        .frame(maxWidth: .infinity)
    }
}

struct TabView: View {
    @Binding var tabIdx: Tab
    
    @State var tabs: [Tab] = Tab.allCases
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                Spacer()
                TabBarItem(tabType: tab, isSelected: tabIdx == tab) {
                    self.tabIdx = tab
                }
            } 
            Spacer()
        }
        .padding(.top, 16)
        .padding(.bottom, 40)
        .frame(height: 106)
        .background(Color("backgroundDarkColor"))
    }
}


struct BottomTabBar: View {
    @State var tabIdx: Tab = .collection
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                switch tabIdx {
                case .scan: Color.red
                case .collection: CollectionsView()
                case .shop: Color.blue
                case .settings: Color.orange
                }
                TabView(tabIdx: self.$tabIdx)
            }
            .ignoresSafeArea(.all)
        }
    }
}
