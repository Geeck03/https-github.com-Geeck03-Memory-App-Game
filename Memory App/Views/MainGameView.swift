//
//  MainGameView.swift
//  Memory App
//
//  Created by Sewell, Aramaea on 3/9/25.
//

import SwiftUI

struct MainGameView: View {
    @ObservedObject var viewModel = CardGameViewModel()
    //Tracks the device orientation
    @State private var deviceOrientation: UIDeviceOrientation = UIDevice.current.orientation
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Color.blue.opacity(0.2)
                    .edgesIgnoringSafeArea(.all)
                
                
                if deviceOrientation.isLandscape {
                    HStack {
                        createCardGrid(screenSize: geometry.size)
                        ControlPanelView(viewModel: viewModel)
                    }
                } else {
                    VStack {
                        createCardGrid(screenSize: geometry.size)
                        ControlPanelView(viewModel: viewModel)
                    }
                }
            }
            .onAppear {
                UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            }
            .onChange(of: deviceOrientation) { _ in
                withAnimation(.spring()) {
                    //Animates the transitions when orientation change occurs
                    updateDeviceOrientation()
                }
            }
        }
        .onDisappear() {
            UIDevice.current.endGeneratingDeviceOrientationNotifications()
        }
    }
    private func updateDeviceOrientation() {
        deviceOrientation = UIDevice.current.orientation
    }
    
    func createCardGrid(screenSize: CGSize) -> some View {
        let gridConfig = getGridConfiguration (for: screenSize)
        let cardWidth = gridConfig.cardWidth
        let rows = gridConfig.rows
        
        return LazyVGrid(columns: gridConfig.columns, spacing: 10) {
            ForEach(viewModel.cards) { card in
                CardView(viewModel: viewModel, card: card)
                    .frame(width: cardWidth, height: cardWidth * 1.5)
                    .padding(5)
            }
        }
        .padding()
    }
    
    func getGridConfiguration(for screenSize: CGSize) -> (columns: [GridItem], cardWidth: CGFloat, rows: Int) {
        let isLandScape = deviceOrientation.isLandscape
        let cardWidth: CGFloat
        
        if isLandScape {
            cardWidth = max(100, screenSize.width / 6)
        } else {
            cardWidth = max(80, screenSize.width / 4)
        }
        
        let rows = Int(screenSize.height / (cardWidth * 1.5))
        let columns = [GridItem(.flexible())]
        
        return (columns, cardWidth, rows)
    }
}



#Preview {
    MainGameView()
}
