//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Kyle Morton on 8/1/25.
//

import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    @Binding var value: Bool
    
    var body: some View {
        
        Button {
            value.toggle()
        } label: {
            Text(title)
                .frame(width: 280, height: 50) // must come before the colors (those should be wrapped around the frame, not the Text())
                .background(backgroundColor.gradient)
                .foregroundColor(textColor)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
        }
        
    }
}

#Preview {
    @Previewable @State var value = false
    WeatherButton(title: value ? "Button - On" : "Button - Off", textColor: Color.white, backgroundColor: Color.blue, value: $value)
    
}
