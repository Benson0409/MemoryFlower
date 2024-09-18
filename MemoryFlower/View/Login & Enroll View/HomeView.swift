//
//  ContentView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/2.
//

import SwiftUI

struct HomeView: View {
    @Binding var isSuccess:Bool

    var body: some View {
        NavigationStack{
            ZStack {
                Color.orange
                    .opacity(0.7)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    VStack{
                        Text("記憶花")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("時時關心提醒，負擔天天減低")
                    }
                    
                    Spacer()
                    
                    
                    NavigationLink(destination: LoginView(isSuccess: $isSuccess)) {
                        Text("登陸")
                            .padding()
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .clipShape(.rect(cornerRadius:15))
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    NavigationLink(destination: EnrollView(isSuccess: $isSuccess)) {
                        Text("註冊")
                            .padding()
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .clipShape(.rect(cornerRadius:15))
                    }
                    .buttonStyle(PlainButtonStyle())
                    
    
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView(isSuccess: .constant(true))
}
