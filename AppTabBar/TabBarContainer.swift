//
//  TabBarContainer.swift
//  AppTabBar
//
//  Created by Satyadev Chauhan on 06/03/23.
//

import SwiftUI

struct TabBarContainer<Content:View>: View {
    
    // MARK: - Property
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: [TabBarItem] = []
    
    // MARK: - Init
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()
            TabBarView(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            tabs = value
        }
    }
}

// MARK: - Preview

struct TabBarContainer_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.home, .search, .messages, .profile]
    
    static var previews: some View {
        TabBarContainer(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
