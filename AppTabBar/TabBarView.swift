//
//  TabBarView.swift
//  AppTabBar
//
//  Created by Satyadev Chauhan on 06/03/23.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: -  Property
    
    let tabs: [TabBarItem]
    @Binding  var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    
    // MARK: -  Body
    
    var body: some View {
        //tabBarVersion1
        tabBarVersion2
            .onChange(of: selection) { newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}

// MARK: -  Extension

extension TabBarView {
    private func switchToTab(tab: TabBarItem) {
        selection = tab
    }
}

// tabBarVersion1
extension TabBarView {
    private func tabView1(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.image)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(selection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBarVersion1: some View {
        HStack {
            ForEach(tabs) { tab in
                tabView1(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}

// tabBarVersion2
extension TabBarView {
    private func tabView2(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.image)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs) { tab in
                tabView2(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
}

// MARK: -  Preview

struct TabBarView_Previews: PreviewProvider {
    
    static let tabs: [TabBarItem] = [.home, .search, .profile]
    
    static var previews: some View {
        VStack {
            Spacer()
            TabBarView(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}
