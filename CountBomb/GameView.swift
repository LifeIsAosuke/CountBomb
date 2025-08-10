//
//  GameView.swift
//  CountBomb
//
//  Created by A S on 2025/08/11.
//

import SwiftUI

struct GameView: View {
    
    @Binding var currentScreen: Screen
    @State private var countNumber: Int = 0 // タップ回数
    @State private var bombNumber: Int = 0 // 必要タップ数
    @State private var timeLimit: Int = 0 // 制限時間(秒)
    @State private var remainingTime: Int = 0 // 残り時間
    @State private var timer: Timer? // タイマー保持用
    
    @State var yScale: CGFloat = 1
    @State var xScale: CGFloat = 1
    
    var body: some View {
        ZStack {
            
            //　ここで背景を変更
            Color(.gray)
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("残り時間: \(remainingTime)秒")
                    .font(.title)
                
                Text("タップ数: \(countNumber) / \(bombNumber)")
                    .font(.headline)
                
                Button {
                    buttonTapped()
                } label: {
                    Image(systemName: "button.horizontal.top.press")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaleEffect(x: xScale, y: yScale)
                }
                .padding()
            }
        }
        .onAppear {
            // 必要タップ数と制限時間をランダム決定
            bombNumber = Int.random(in: 50...100)
            timeLimit = Int.random(in: 20...40)
            remainingTime = timeLimit
            
            limitedTimer()
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    func buttonTapped() {
        // 画像の大きさを変更
        let scale = CGFloat(countNumber) / CGFloat(bombNumber)
        xScale = 1 + scale * 1.5
        yScale = 1 + scale
        
        countNumber += 1
        // 成功条件チェック
        if countNumber >= bombNumber {
            timer?.invalidate()
            currentScreen = .success
        }
    }
    
    func limitedTimer() {
        // 1秒ごとにカウントダウン
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            remainingTime -= 1
            if remainingTime <= 0 {
                timer?.invalidate()
                // タップ数不足なら失敗
                if countNumber >= bombNumber {
                    currentScreen = .success
                } else {
                    currentScreen = .failure
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var currentScreen: Screen = .game
    GameView(currentScreen: $currentScreen)
}
