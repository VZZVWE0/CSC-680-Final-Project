//
//  GameplayScreen.swift
//  Blackjack
//
//  Created by Anna Marie Felipe on 5/02/25.
//
import SwiftUI

struct GameplayScreen: View {
    
    @StateObject private var game = BlackjackGame()

    var body: some View {
        ZStack {
            Image("liquid-cheese")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Blackjack")
                    .font(.custom("Copperplate", size: 68))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.top, 20)

                Spacer()

                // Dealer's Hand
                VStack {
                    Text("Dealer's Hand")
                        .font(.custom("Copperplate", size: 24))
                        .foregroundColor(.yellow)

                    ZStack {
                        ForEach(0..<game.dealerCards.count, id: \.self) { index in
                            if game.isGameOver || index > 0 {
                                Image(game.dealerCards[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 120)
                                    .offset(x: CGFloat(index) * 30)
                            } else {
                                Image("astronaut")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 120)
                                    .offset(x: CGFloat(index) * 30)
                            }
                        }
                    }
                }

                // Player's Hand
                VStack {
                    Text("Your Hand")
                        .font(.custom("Copperplate", size: 24))
                        .foregroundColor(.yellow)

                    ZStack {
                        ForEach(0..<game.playerCards.count, id: \.self) { index in
                            Image(game.playerCards[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 120)
                                .offset(x: CGFloat(index) * 30)
                        }
                    }
                }

                VStack {
                    if let result = game.result {
                        Text(result)
                            .font(.title2)
                            .foregroundColor(.yellow)
                            .padding()
                            .frame(maxHeight: 50)
                    } else {
                        Text("")
                            .frame(maxHeight: 50)
                    }
                }
                .frame(height: 50)

                // Game buttons
                HStack(spacing: 20) {
                    Button(action: {
                        game.hit()
                    }) {
                        Text("Hit")
                            .font(.custom("Copperplate", size: 18))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 100)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors:[Color.red, Color.orange]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)
                    }
                    .disabled(game.isGameOver)

                    Button(action: {
                        game.stand()
                    }) {
                        Text("Stand")
                            .font(.custom("Copperplate", size: 18))
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 100)
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.red, Color.orange]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .cornerRadius(20)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)
                    }
                    .disabled(game.isGameOver)
                }

                Button(action: {
                    game.resetGame()
                }) {
                    Text("Restart")
                        .font(.custom("Copperplate", size: 10))
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 75)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors:[Color.gray.opacity(0.8), Color.black.opacity(0.8)]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.3), radius: 4, x: 2, y: 2)
                }

                .padding(.top, 10)

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(false)
    }
}

#Preview {
    GameplayScreen()
}
