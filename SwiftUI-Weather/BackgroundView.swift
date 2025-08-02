//
//  BackgroundView.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 7/31/25.
//

import SwiftUI


struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        
        // You can add as many colors to the array (it's really cool)
        LinearGradient(
            colors: [topColor, bottomColor],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}
