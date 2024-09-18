//
//  CustomTabView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/6.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var tabSelection:Int
    @Namespace private var animationNamespace
    
    var tabViewItem:[(image:String,name:String)] = [
        ("figure.strengthtraining.traditional","訓練"),
        ("house.fill","記憶花"),
        ("person.circle.fill","個人設定"),
    ]
    

    
    var body: some View {
        ZStack{
            Capsule()
                .frame(height: 80)
                .foregroundStyle(.secondary)
                .shadow(radius: 2)
            
            HStack{
                ForEach(tabViewItem.indices, id: \.self){index in
                    Button(action: {
                        tabSelection = index + 1
                    }, label: {
                        VStack(spacing: 8){
                            Spacer()
                            Image(systemName: tabViewItem[index].image)
                            Text(tabViewItem[index].name)
                            
                            if index + 1 == tabSelection{
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(Color.yellow)
                                    .matchedGeometryEffect(id: "SelectTabID", in: animationNamespace)
                                    .offset(y:3)
                            }
                            else{
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundStyle(Color.clear)
                                    .offset(y: 3)
                            }
                        }
                        .foregroundStyle(index + 1 == tabSelection ? Color.yellow : Color.gray)
                    })
                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    CustomTabView(tabSelection: .constant(1))
        .previewLayout(.sizeThatFits)
        .padding(.vertical)
}
