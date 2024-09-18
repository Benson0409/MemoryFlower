//
//  TabView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/6.
//

import SwiftUI

struct TabControlView: View {
    @State private var tabSelection:Int = 2
    @State private var isSuccess:Bool = false
    
    var body: some View {
        TabView(selection: $tabSelection) {
            FirstView()
                .tag(1)
            NavigationStack{
                MainView()
            }
            .tag(2)
            
            Text("Tab Content 3")
                .tag(3)
            
        }
        .navigationBarBackButtonHidden()
        .overlay(alignment: .bottom) {
            CustomTabView(tabSelection: $tabSelection)
        }
        .fullScreenCover(isPresented: .constant(!isSuccess)) {
            PersonalSettingView(isInput: $isSuccess)
        }
    }
}


struct FirstView: View {
    var body: some View {
        VStack {
            Text("這是 Tab 1")
        }
        .navigationTitle("首頁")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // Action for Tab 1
                }) {
                    Image(systemName: "bell.fill")
                }
            }
        }
    }
}

#Preview {
    TabControlView()
}
