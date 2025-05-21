//
//  GameLogic.swift
//  Blackjack
//
//  Created by Anna Marie Felipe on 5/02/25.
//
import Foundation

class BlackjackGame: ObservableObject {
    
    @Published var deck: [String] = []
    @Published var playerCards: [String] = []
    @Published var dealerCards: [String] = []
    @Published var result: String? = nil
    @Published var isGameOver: Bool = false

    let cardValues: [String: Int] = ["2": 2, "3": 3, "4": 4, "5": 5, "6": 6,
                                     "7": 7, "8": 8, "9": 9, "10": 10,
                                     "jack": 10, "queen": 10, "king": 10, "ace": 11]

    init() {
        resetGame()
    }

    func resetGame() {
        deck = createDeck()
        deck.shuffle()
        playerCards = [drawCard(), drawCard()]
        dealerCards = [drawCard(), drawCard()]
        result = nil
        isGameOver = false
    }

    func hit() {
        playerCards.append(drawCard())
        if handValue(playerCards) > 21 {
            result = "Bust! You Lose."
            isGameOver = true
        }
    }

    func stand() {
        while handValue(dealerCards) < 17 {
            dealerCards.append(drawCard())
        }

        let playerTotal = handValue(playerCards)
        let dealerTotal = handValue(dealerCards)

        if dealerTotal > 21 {
            result = "You Win!"
        } else if playerTotal > dealerTotal {
            result = "You Win!"
        } else if playerTotal < dealerTotal {
            result = "Dealer Wins!"
        } else {
            result = "Tie. No one wins."
        }

        isGameOver = true
    }

    private func drawCard() -> String {
        if deck.isEmpty {
            print("Deck is empty — reshuffling.")
            deck = createDeck()
            deck.shuffle()
        }
        return deck.removeFirst()
    }

    private func handValue(_ hand: [String]) -> Int {
        var total = 0
        var aces = 0

        for card in hand {
            let nameOnly = card.components(separatedBy: "/").last ?? card
            let parts = nameOnly.components(separatedBy: "_")
            let rank = parts.count == 2 ? parts[1] : "0"

            total += cardValues[rank] ?? 0
            if rank == "ace" { aces += 1 }
        }

        // Adjustment to account for aces
        while total > 21 && aces > 0 {
            total -= 10
            aces -= 1
        }

        return total
    }

    private func createDeck() -> [String] {
        let suits = ["hearts", "diamonds", "clubs", "spades"]
        let ranks = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "jack", "queen", "king", "ace"]

        var newDeck: [String] = []
        for suit in suits {
            for rank in ranks {
                newDeck.append("\(suit)_\(rank)")
            }
        }
        return newDeck
    }
}

