//
//  StartView.swift
//  CountBomb
//
//  Created by A S on 2025/08/11.
//

import SwiftUI

struct StartView: View {
    
    @Binding var currentScreen: Screen
    
    var body: some View {
        
        Text("スタート画面だよ")
        
        Spacer()
        
        Button {
            
            currentScreen = .game
        } label: {
            Text("ゲームスタート")
        }
        .foregroundStyle(.white)
        .background(.green)
        .padding()
        
        Spacer()
    }
}

#Preview {
    @Previewable @State var currentScreen: Screen = .start
    StartView(currentScreen: $currentScreen)
}
