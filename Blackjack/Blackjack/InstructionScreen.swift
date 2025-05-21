//
//  InstructionScreen.swift
//  Blackjack
//
//  Created by Anna Marie Felipe on 5/02/25.
//

import SwiftUI

struct InstructionScreen: View {
    var body: some View {
        ZStack {
            Image("liquid-cheese")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView {
                
                VStack(alignment: .center, spacing: 10) {
                    
                    Text("Rules")
                        .font(.custom("Copperplate", size: 32))
                        .foregroundColor(.yellow)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 10)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("GOAL: Draw 21 or beat the dealer.")
                            .font(.custom("Copperplate", size: 19))
                            .foregroundColor(.yellow)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 10)
                    }
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("♠ You start with two card hand. Draw cards to get as close to 21 as possible without going over.")
                        Text("♠ Tap **Hit** to draw a new card.")
                        Text("♠ Tap **Stand** to stay with your current hand.")
                        Text("♠ If your hand goes over 21, it's a **bust** and you lose.")
                        Text("♠ If the dealer goes over 21 or you have the higher total, you **win**!")
                        Text("♠ Each number card is worth its face value while **J**, **Q**, and **K** are worth 10. **Aces** are worth 1 or 11.")
                    }
                    .font(.body)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 350)
                    
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 20)
            }
        }
    }
}
