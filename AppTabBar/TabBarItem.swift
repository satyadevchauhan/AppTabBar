//
//  TabBarItem.swift
//  AppTabBar
//
//  Created by Satyadev Chauhan on 06/03/23.
//

import SwiftUI

enum TabBarItem: Identifiable, Hashable, CaseIterable {
    
    case home, search, messages, profile
    
    var id: Self {
        return self
    }
    
    var image: String {
        switch self {
        case .home: return "house"
        case .search: return "magnifyingglass"
        case .messages: return "message"
        case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .search: return "Search"
        case .messages: return "Messages"
        case .profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.orange
        case .search: return Color.blue
        case .messages: return Color.green
        case .profile: return Color.red
        }
    }
}
