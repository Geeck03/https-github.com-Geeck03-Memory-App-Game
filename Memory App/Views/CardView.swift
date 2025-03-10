//
//  CardView.swift
//  Memory App
//
//  The CardView Modle. Simple had animations 
//

import SwiftUI

struct CardView: View {
    
    //Card ViewModle
    @ObservedObject var viewModel: CardGameViewModel
    let card: Card
    @State private var dragAmount: CGSize = .zero
    @State private var isFaceUp: Bool = false
    
    
    
    
    var body: some View {
        
        ZStack {
            if isFaceUp{
                CardFront
            }
            else {
                CardBack
            }
        }
        .frame(width: 100, height: 150)
        .rotation3DEffect (
            .degrees(isFaceUp ? 100 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .gesture(
            TapGesture().onEnded {
                withAnimation {
                    isFaceUp.toggle()
                }
            }
        )
        .gesture(
            DragGesture()
                .onChanged { value in
                    dragAmount = value.translation
                }
                .onEnded { _ in
                    withAnimation {
                        dragAmount = .zero
                    }
                }
        )
        .offset(dragAmount)
    }
    
    
    //represents the card front. We create Card, but having a rectangle
    private var CardFront: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.pink)
            .overlay(
                //Later needs to be card content!
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
            )
            .shadow(radius: 5)
            .opacity(isFaceUp ? 1: 0)
    }
    
    private var CardBack: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.green)
            .overlay(
                //Later needs to be card content!
                Text(card.content)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                
            )
            .shadow(radius: 5)
            .opacity(isFaceUp ? 0: 1)
    }
        
}

/*
#Preview {
    //card needed here?
    CardView()
}
*/
