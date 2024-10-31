//
//  MainView.swift
//  DiceView
//
//  Created by Wanmy on 28/10/24.
//

import SwiftUI

struct MainView: View {
    
    @State private var numberOfDice: Int = 2
    
    var body: some View {
        
        VStack{
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundColor(.white)
            
            HStack{
                ForEach(1...numberOfDice , id: \.description){
                    _ in DiceView()
                }
            }
            .padding()
            HStack{
                Button("Remove Dice", systemImage: "minus.circle.fill"){
                    withAnimation{
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)
                .padding()
                
                Button("Add dice", systemImage: "plus.circle.fill"){
                    withAnimation{
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
        }
        .padding()
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(.cyan)
        .tint(.white)
    }
}

#Preview {
    MainView()
}
