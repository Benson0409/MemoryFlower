//
//  PersonTextFieldView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/9.
//

import SwiftUI

struct PersonTextFieldView: View {
    @State private var name: String = ""
    @State private var birthDate: Date = Date()
    @State private var selectedGender: String = "男" // 預設為 "男"
    let genders = ["男", "女", "其他"]
    var body: some View {
        ZStack {
            
            VStack(alignment: .leading, spacing: 20) {
                // 姓名輸入框
                Text("姓名:")
                    .font(.headline)
                TextField("請輸入您的姓名", text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                //                // 出生年月日選擇器
                //                Text("出生年月日:")
                //                    .font(.headline)
                //                DatePicker("請選擇出生日期", selection: $birthDate, displayedComponents: .date)
                //                    .datePickerStyle(WheelDatePickerStyle())
                //                    .labelsHidden()
                // 出生年月日選擇器
                Text("請選擇出生日期:")
                    .font(.headline)
                DatePicker("出生年月日:", selection: $birthDate, displayedComponents: .date)
                    .datePickerStyle(DefaultDatePickerStyle()) // 下拉式選擇日期
                    .padding()
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                //                 性別選擇器
                Text("性別:")
                    .font(.headline)
                Picker("性別", selection: $selectedGender) {
                    ForEach(genders, id: \.self) { gender in
                        Text(gender)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                //                Text("性別:")
                //                    .font(.headline)
                //                Picker("性別", selection: $selectedGender) {
                //                    ForEach(genders, id: \.self) { gender in
                //                        Text(gender)
                //                    }
                //                }
                //                .pickerStyle(MenuPickerStyle())
                //                .frame(maxWidth: .infinity)// 使用下拉選單
                //                .padding()
                //                .background(Color(.systemGray6))
                //                .clipShape(RoundedRectangle(cornerRadius: 15))
//                
//                Spacer()
//                
//                // 顯示輸入結果
//                Text("您輸入的資訊:")
//                    .font(.headline)
//                    .padding(.top)
//                
//                Text("姓名: \(name)")
//                Text("出生日期: \(formattedDate(birthDate))")
//                Text("性別: \(selectedGender)")
                
                Spacer()
            }
            .padding()
        }
        
    }
}

private func formattedDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter.string(from: date)
}

#Preview {
    PersonTextFieldView()
}
