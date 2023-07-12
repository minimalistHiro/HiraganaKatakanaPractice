//
//  ContentView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/07.
//

import SwiftUI

struct ContentView: View {
    var setting = Setting()
    
    @State private var endedDrawPoints: [DrawPoints] = []
    @State private var isShowLebel1: Bool = false       // レベル1表示有無
    @State private var isShowLebel2: Bool = false       // レベル2表示有無
    @State private var isShowLebel3: Bool = false       // レベル3表示有無
    @State private var navigationPath = NavigationPath()
    @State private var selectedLevel: Int = 0           //選択されたレベル
    @State private var isDoubleText: Bool = false// "きゃ、きゅ、きょ"などの一つの升に2文字以上入るテキストか否か

    var body: some View {
        NavigationStack(path: $navigationPath) {
            LevelSelectView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, isDoubleText: $isDoubleText)
            .navigationDestination(for: Int.self) { index in
                HiraganaListView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, isDoubleText: $isDoubleText)
            }
            .navigationDestination(for: String.self) { hiragana in
                // ひらがなが一文字の場合と、一文字以上でViewを分ける。
                if isDoubleText {
                    DoubleTextPracticeView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, text: hiragana)
                } else {
                    PracticeView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, text: hiragana)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
