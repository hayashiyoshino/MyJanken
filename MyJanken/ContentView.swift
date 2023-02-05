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
            // スペースを追加
            Spacer()
            
            if answerNumber == 0 {
                Text("これからじゃんけんをします")
                    .padding(.bottom)
            } else if answerNumber == 1 {
                // グー画像を指定
                Image("gu")
                // リサイズを指定
                    .resizable()
                // アスペクト比を維持しつつ画面に収める指定
                    .scaledToFit()
                Spacer()
                // じゃんけんの種類を指定
                Text("グー")
                    .padding(.bottom)
            } else if answerNumber == 2 {
                Image("choki")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("チョキ")
                    .padding(.bottom)
            } else {
                Image("pa")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("パー")
                    .padding(.bottom)
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
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
