//
//  ContentView.swift
//  CountBomb
//
//  Created by A S on 2025/08/11.
//

import SwiftUI

// MARK: - App Screens Enum
enum Screen {
    //enumは限定された選択肢を扱う型で、画面の状態を管理するために使っているよ！
    case start
    case game
    case success
    case failure
}

struct ContentView: View {
    
    @State private var currentScreen: Screen = .start
    
    var body: some View {
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            
            //ここで画面を切り替えてるよ〜
            switch currentScreen {
            case .start:
                StartView(currentScreen: $currentScreen)
            case .game:
                GameView(
                    currentScreen: $currentScreen
                )
            case .success:
                SuccessView(
                    currentScreen: $currentScreen
                )
            case .failure:
                FailureView(
                    currentScreen: $currentScreen
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
