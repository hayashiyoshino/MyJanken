//
//  ContentView.swift
//  MyJanken
//
//  Created by Yoshino Hayashi on 2023/02/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            // グー画像を指定
            Image("gu")
            // リサイズを指定
                .resizable()
            // アスペクト比を維持しつつ画面に収める指定
                .scaledToFit()
            // じゃんけんの種類を指定
            Text("グー")
            // [じゃんけんをする！]ボタン
            Button {
                // Buttonがタップされた時の動きを記述
                print("タップされたよ！")
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
