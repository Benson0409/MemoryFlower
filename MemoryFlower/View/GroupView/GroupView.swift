//
//  GroupView.swift
//  MemoryFlower
//
//  Created by Benson on 2024/9/10.
//

import SwiftUI

struct GroupView: View {
    let group:Group
    var body: some View {
        HStack {
            
            if let flowerImage = group.image{
                Image(flowerImage)
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
                    
            }
            
            Spacer()

            VStack(alignment:.leading)
            {
                HStack(alignment: .bottom){
                    Text(group.name)
                        .font(.title2)
                        .bold()
                    Text(group.flowerState)
                        .font(.subheadline)
                        .fontWeight(.thin)
                }
                HStack(alignment: .bottom){
                    Text("Exp:")
                        .bold()
                    ProgressView(value: group.experience, total: 100)
                        .progressViewStyle(LinearProgressViewStyle(tint: .green))
                        .frame(width: 150, height: 10)
                        .cornerRadius(5)
                    
                }
            }
            
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(20)
        .shadow(radius: 15)
    }
}


struct Group:Identifiable{
    let id = UUID()
    let name:String
    let flowerState:String
    let image:String?
    let experience:Double
}



#Preview {
    GroupView(
        group: Group(
            name: "長青老人",
            flowerState: "鈴蘭成花",
            image: "flowertest",
            experience: 50
        )
    )
    .padding()
}
