//
//  MainView.swift
//  StaticInstagram
//
//  Created by xhiew on 1/4/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(selectedTab == 0 ? "home.fill" : "home")
                }.tag(0)
            
            SearchView()
                .tabItem {
                    Image(selectedTab == 1 ? "search.fill": "search")
                }.tag(1)
            
            ReelsView()
                .tabItem {
                    Image(selectedTab == 2 ? "heart.fill" : "heart")
                }.tag(2)
            
            PersonalView()
                .tabItem {
                    Image("personal")
                }.tag(3)
        }
    }
}

#Preview {
    MainView()
}
