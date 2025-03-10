//
//  Card.swift
//  Memory App
//
//  Created by Sewell, Aramaea on 3/9/25.
//

import Foundation
import CoreGraphics

struct Card: Identifiable, Codable {
    
    //Assigns a unique identifer to each instance of the class. Generates a random unique value
    
    //ID for each card
    var id = UUID()

    //There is a default emoji, but it can be changed
    var content: String
    var isMatched: Bool
    var isFaceUp: Bool
    var xPosition: CGFloat
    var yPosition: CGFloat
    
    //This intializes the NoteOBject with this information.
    init(content: String = "💕", isMatched: Bool = false, isFaceUp: Bool = false, xPosition: CGFloat = 0.0, yPosition: CGFloat = 0.0) {
        self.content = content
        self.isMatched = isMatched
        self.isFaceUp = isFaceUp
        self.xPosition = xPosition
        self.yPosition = yPosition
    }
}
