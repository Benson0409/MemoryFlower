//
//  MainView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/3.
//

import SwiftUI

struct MainView: View {
    @State private var showSheet = false
    @State private var groupName = ""
    
    // 群組初始化為空陣列
    @State private var group: [Group] = []
    
    var body: some View {
        
        ZStack(alignment: group.isEmpty ? .center : .top){
            
            Color.orange
                .opacity(0.7)
                .ignoresSafeArea()
            
            VStack{
                if group.isEmpty{
                    Text("尚無資料")
                    Button(action: {
                        showSheet = true
                    }, label: {
                        Text("創建群組")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding()
                            .background(Rectangle().fill(Color.red))
                            .clipShape(.rect(cornerRadius: 15))
                    })
                    .buttonStyle(PlainButtonStyle())
                    .shadow(color: .black, radius: 2,x: 0,y: 0)
                    
                    Text("或")
                    Button(action: {
                        showSheet = true
                    }, label: {
                        Text("加入群組")
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .padding()
                            .background(Rectangle().fill(Color.red))
                            .clipShape(.rect(cornerRadius: 15))
                    })
                    .buttonStyle(PlainButtonStyle())
                    .shadow(color: .black, radius: 2,x: 0,y: 0)
                }
                else{
                    ForEach(group) { group in
                        GroupView(group: group)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSheet = true
                    }) {
                        Image(systemName: "person.3.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSheet = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
                
            }
            .sheet(isPresented: $showSheet) {
                ZStack{
                    Color.orange
                        .opacity(0.7)
                        .ignoresSafeArea()
                    VStack {
                        Text("創建群組名稱")
                            .font(.headline)
                            .padding()
                        
                        TextField("輸入群組名稱", text: $groupName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        HStack {
                            Button("取消") {
                                showSheet = false
                            }
                            .padding()
                            
                            Spacer()
                            
                            Button("創建") {
                                group.append(
                                    Group(
                                        name: groupName,
                                        flowerState: "種子",
                                        image: "flowertest",
                                        experience: 0
                                    )
                                )
                                print("Group Created: \(groupName)")
                                showSheet = false
                            }
                            .padding()
                        }
                    }
                    .padding()
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    NavigationStack{
        MainView()
    }
}
