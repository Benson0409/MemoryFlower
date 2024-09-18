//
//  EnrollView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/2.
//

import SwiftUI

struct EnrollView: View {
    @State private var isPasswordVisible: Bool = false
    @State var userName:String = ""
    @State var password:String = ""
    @State var againPassword:String = ""
    
    @Binding var isSuccess:Bool
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.orange
                    .opacity(0.7)
                    .ignoresSafeArea()
                
                VStack{
                    VStack{
                        Text("註冊帳號")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("關心零距離，距離更靠近")
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("請輸入電子郵件:")
                            .fontWeight(.bold)
                        TextField("電子郵件", text: $userName)
                            .padding()
                            .background(Color(.systemGray6))
                            .clipShape(.rect(cornerRadius: 15))
                            .padding(.bottom, 20)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .textContentType(.username)
                        
                        Text("請輸入密碼:")
                            .fontWeight(.bold)
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
                        
                        Text("請再次輸入密碼:")
                            .fontWeight(.bold)
                        
                        // 密碼輸入框
                        HStack {
                            
                            SecureField("密碼", text: $againPassword)
                                .textContentType(.password)
                            
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(.rect(cornerRadius: 15))
                        .padding(.bottom, 40)
                        
                        
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isSuccess = true
                    }, label: {
                        Text("註冊")
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
    EnrollView(isSuccess: .constant(false))
}
