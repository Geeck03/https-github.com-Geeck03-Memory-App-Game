//
//  ControlPanelView.swift
//  Memory App
//
//  Created by Sewell, Aramaea on 3/9/25.
//

import SwiftUI

struct ControlPanelView: View {
    
    @ObservedObject var viewModel: CardGameViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Text("Score: \(viewModel.score)")
                    .font(.headline)
                Spacer()
                Text("Moves: \(viewModel.moves)")
                    .font(.headline)
            }
            .padding()
            
            HStack {
                Button(action : {
                    withAnimation(.spring()) {
                        viewModel.startNewGame() //rests the game
                    }
                }) { Text ("New game")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                
                Button(action: {
                    withAnimation(.spring()) {
                        viewModel.shuffleCards() //shuffle cards
                    }
                    
                }) {
                    Text("Shuffle")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            
            
            if viewModel.gameOver {
                Text("Game Over!")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

/*
 #Preview {
 ControlPanelView()
 }
 */ 
