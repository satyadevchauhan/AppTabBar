//
//  ContentView.swift
//  AppTabBar
//
//  Created by Satyadev Chauhan on 06/03/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    @State private var selectedTab: TabBarItem = .home
    
    // MARK: - Body
    
    var body: some View {
        TabBarContainer(selection: $selectedTab) {
            ForEach(TabBarItem.allCases) { item in
                item.color
                    .tabBarItem(tab: item, selection: $selectedTab)
            }
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
