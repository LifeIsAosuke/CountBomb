//
//  SuccessView.swift
//  CountBomb
//
//  Created by A S on 2025/08/11.
//

import SwiftUI

struct SuccessView: View {
    
    @Binding var currentScreen: Screen
    
    var body: some View {
        ZStack {
            
            // ここで背景色を変える
            Color(.yellow)
                .ignoresSafeArea()
            
            VStack {
                Text("成功画面だよ")
                
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
    SuccessView(currentScreen: $currentScreen)
}
