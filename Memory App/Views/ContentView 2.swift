//
//  ContentView.swift
//  Memory App
//
//  Created by Sewell, Aramaea on 3/9/25.
//

import SwiftUI
//import CardGameViewModel


struct ContentView: View {
    @StateObject private var viewModel = CardGameViewModel()
    
    
    var body: some View {
        VStack {
            
            ControlPanelView(viewModel: viewModel)
            
            //Creates the top bar.
            Text("Score: \(viewModel.score) Moves: \(viewModel.moves)")
                .font(.headline)
            //A simple grid that is adaptive
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                ForEach(viewModel.cards) { card in
                    CardView(viewModel: viewModel, card: card)
                }
            }
            
            Button("New Game!!") {
                withAnimation {
                    viewModel.startNewGame()
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
