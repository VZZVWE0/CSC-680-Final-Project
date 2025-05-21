//
//  ContentView.swift
//  Blackjack
//
//  Created by Anna Marie Felipe on 5/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Image("liquid-cheese")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Text("Blackjack")
                        .font(.custom("Copperplate", size: 68))
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: .yellow, location: 0.0),
                                    .init(color: .yellow, location: 0.4),
                                    .init(color: .black, location: 1.0)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )

                        .shadow(color: .black.opacity(0.6), radius: 4, x: 2, y: 2)
                        .bold()
                        .padding()

                    //Homescreen Buttons
                    NavigationLink(destination: GameplayScreen()) {
                        Text("Start Game")
                            .font(.custom("Copperplate", size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.red, Color.orange]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(30)
                    }
                   
                    NavigationLink(destination: InstructionScreen()) {
                        Text("How to Play")
                            .font(.custom("Copperplate", size: 24))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.gray.opacity(0.8), Color.black.opacity(0.8)]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(30)
                    }

                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
