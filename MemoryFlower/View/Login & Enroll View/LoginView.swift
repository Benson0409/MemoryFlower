//
//  LoginView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/2.
//

import SwiftUI

struct LoginView: View {
    @State private var isPasswordVisible: Bool = false
    @State var userName:String = ""
    @State var password:String = ""
    
    @Binding var isSuccess:Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.orange
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                VStack{
                    VStack{
                        Text("記憶花")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("時時關心提醒，負擔天天減低")
                    }
                    
                    Spacer()
                    
                    VStack{
                        TextField("電子郵件", text: $userName)
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(.rect(cornerRadius: 15))
                            .padding(.bottom, 20)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .textContentType(.username)
                        
                        // 密碼輸入框
                        HStack {
                            if isPasswordVisible {
                                TextField("密碼", text: $password)
                                    .textContentType(.password)
                            } else {
                                SecureField("密碼", text: $password)
                                    .textContentType(.password)
                            }
                            
                            Button(action: {
                                isPasswordVisible.toggle()
                            }, label: {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            })
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.bottom, 40)
                        
                        HStack{
                            Spacer()
                            Text("？忘記密碼")
                                .font(.subheadline)
                                .foregroundStyle(.blue)
                                
                        }
                        
                    }
                    
                    Spacer()
                    

                    Button(action: {
                        isSuccess = true
                    }, label: {
                        Text("登陸")
                            .padding()
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .background(.red)
                            .clipShape(.rect(cornerRadius:15))
                    })
                    .buttonStyle(PlainButtonStyle())
                    
            
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    LoginView(isSuccess: .constant(false))
}
