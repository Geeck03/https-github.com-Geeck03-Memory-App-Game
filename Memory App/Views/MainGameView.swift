//
//  MainGameView.swift
//  Memory App
//
//  Created by Sewell, Aramaea on 3/9/25.
//

import SwiftUI

struct MainGameView: View {
    @ObservedObject var gameViewModel = CardGameViewModel()
    //Tracks the device orientation
    @State private var deviceOrientation: UIDeviceOrientation = UIDevice.current.orientation
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Color.blue.opacity(0.2)
                    .edgesIgnoringSafeAreas(.all)
                
                
                if deviceOrientation.isLandscape {
                    
                    
                    
                    HStack {
                        createCardGrid(screenSize: geometry.size)
                        ControlPanel(gameViewModel: gameViewModel)
                    }
                } else {
                    VStack {
                        createCardGrid(screenSize: geometry.size)
                        ControlPanel(gameViewModel: gameViewModel)
                    }
                }
            }
            .onAppear {
                UIDevice.current.beginGeneratingDeviceOrientationNotifications()
            }
            .onChange(of: deviceOrientation) { _ in withAnimation(.spring()) {
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
    
    func createCardGrid(screenSize: CgSize) -> some View {
        let gridConfig = getGridConfiguration (for: screenSize)
        let cardWidth = gridcc
    }


#Preview {
    MainGameView()
}
