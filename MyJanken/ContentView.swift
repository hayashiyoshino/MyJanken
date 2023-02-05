//
//  ContentView.swift
//  MyJanken
//
//  Created by Yoshino Hayashi on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    
    // じゃんけんの結果を格納する変数(0=初期画面 1=グー 2=チョキ 3=パー)
    @State var answerNumber = 0
    
    var body: some View {
        
        VStack {
            
            if answerNumber == 0 {
                Text("これからじゃんけんをします")
            } else if answerNumber == 1 {
                // グー画像を指定
                Image("gu")
                // リサイズを指定
                    .resizable()
                // アスペクト比を維持しつつ画面に収める指定
                    .scaledToFit()
                // じゃんけんの種類を指定
                Text("グー")
            } else if answerNumber == 2 {
                Image("choki")
                    .resizable()
                    .scaledToFit()
                Text("チョキ")
                
            } else {
                Image("pa")
                    .resizable()
                    .scaledToFit()
                Text("パー")
            }
            
            // [じゃんけんをする！]ボタン
            Button {
                // じゃんけんの結果を一時的に格納する新しい変数を設ける
                var newAnswerNumber = 0
                
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                repeat {
                    newAnswerNumber = Int.random(in: 1...3)
                    
                    // 前回と同じ結果の時は再度ランダムに数値を出す
                    // 異なる結果の時はrepeatを抜ける
                } while answerNumber == newAnswerNumber
                
                // 新しいじゃんけんの結果を格納
                answerNumber = newAnswerNumber
            } label: {
                // Buttonに表示する文字を指定
                Text("じゃんけんをする！")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
