//
//  CardGameViewModel.swift
//  Memory App
//
//  Created by Sewell, Aramaea on 3/9/25.
//

import SwiftUI

class CardGameViewModel: ObservableObject {
    @Published private(set) var cards: [Card] = []
    @Published private(set) var score: Int = 0
    @Published private(set) var moves: Int = 0
    @Published var gameOver: Bool = false
    //private var gameOver: Bool = false
    private var firstSelectedCard: Card?
    
    init() {
        startNewGame()
    }
    
    func startNewGame() {
        let emojis = ["🤪", "🥸", "😎", "🤓", "😛", "🧙‍♀️"]
        
        //Concatenates the two arrays creating a big array with double the values
        //This allows the array to have two pairs of each emoji
        let pairedEmojis = (emojis + emojis).shuffled()
        
        
        //create a card object, and turns into into an ARRAY of card objects
        cards = pairedEmojis.map { Card(content: $0)}
        score = 0
        moves = 0
        gameOver = false
        firstSelectedCard = nil
    }
    
    
    
    //This function is called when the user selects a card.
    
    
    func selectCard(_ selectedCard: Card) {
        //This line of code checks if the current id of the card matches the selected card.
        //If the condtion is true then...
        
        
        guard let index = cards.firstIndex(where: {$0.id == selectedCard.id}) else { return }
        
        //Ignores the card if already flipped
        guard !cards[index].isFaceUp && !cards[index].isMatched else { return }
        
        if let firstCard = firstSelectedCard {
            moves += 1 //Increase the moves by one
            
            if firstCard.content == selectedCard.content {
                cards[index].isMatched = true
                if let firstIndex = cards.firstIndex(where: {$0.id == firstCard.id}) {
                    cards[firstIndex].isMatched = true
                }
                score += 2
                    
                if cards.allSatisfy({$0.isMatched}) {
                    gameOver = true
                }
            } else {
                score  = max(0, score - 1)
            }
            firstSelectedCard = nil
            } else {
                firstSelectedCard = cards[index]
                for i in cards.indices where !cards[i].isMatched {
                    cards[i].isFaceUp = false
                }
            }
            cards[index].isFaceUp.toggle()
        }
        
        //Shuffles the card array
        func shuffleCards() {
            cards.shuffle()
        }
}

