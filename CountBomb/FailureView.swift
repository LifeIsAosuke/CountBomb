//
//  FailureView.swift
//  CountBomb
//
//  Created by A S on 2025/08/11.
//

import SwiftUI

struct FailureView: View {
    
    
    @Binding var currentScreen: Screen
    
    var body: some View {
        
        ZStack {
            
            Color(.blue)
                .ignoresSafeArea()
            
            VStack {
                Text("失敗画面だよ")
                
                Spacer()
                
                Button{
                    currentScreen = .start
                } label: {
                    Text("スタート画面に戻る")
                }
                .foregroundStyle(.white)
                .background(.green)
                
                Spacer()
            }
        }
    }
}

#Preview {
    @Previewable @State var currentScreen: Screen = .game
    FailureView(currentScreen: $currentScreen)
}
