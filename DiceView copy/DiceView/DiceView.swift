//
//  ContentView.swift
//  DiceView
//
//  Created by Wanmy on 28/10/24.
//

import SwiftUI

struct DiceView: View {
    
    @State private var numberOfPips: Int = 1
    
    var body: some View {
        VStack{
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
            Button("Roll") {
                withAnimation(.smooth) {
                    numberOfPips = Int.random(in: 1...6)
                }
                print("number rolled: \(numberOfPips)")
            }
            .buttonStyle(.bordered)
        }
        
    }
}

#Preview {
    DiceView()
}
