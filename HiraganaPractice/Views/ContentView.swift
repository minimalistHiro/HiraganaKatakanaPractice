//
//  ContentView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var data: FetchedResults<Entity>
    
    let setting = Setting()
    let sounds = Sounds()
    @ObservedObject var bgmViewModel = BGM.shared
    @AppStorage("isVibration") var isVibration: Bool = true     // バイブレーションの有無
    @AppStorage("isBGMPlay") var isBGMPlay: Bool = true         // BGMの有無
    @State private var endedDrawPoints: [DrawPoints] = []
    @State private var navigationPath = NavigationPath()
    @State private var selectedLevel: Int = 0           // 選択されたレベル
    @State private var isDoubleText: Bool = false       // "きゃ、きゅ、きょ"などの一つの升に2文字以上入るテキストか否か
    @State private var nextText: String = ""            // PracticeViewの次のテキスト
    @State private var nextDoubleText: String = ""      // DoubleTextPracticeViewの次のテキスト

    var body: some View {
        NavigationStack(path: $navigationPath) {
            LevelSelectView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, isDoubleText: $isDoubleText)
            .navigationDestination(for: Int.self) { index in
                HiraganaListView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, isDoubleText: $isDoubleText)
            }
            .navigationDestination(for: String.self) { hiragana in
                // ひらがなが一文字の場合と、一文字以上でViewを分ける。
                if isDoubleText {
                    DoubleTextPracticeView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, nextText: $nextDoubleText, isVibration: $isVibration, text: hiragana)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                sounds.fileName = hiragana
                                sounds.playSound()
                            }
                        }
                        .onChange(of: navigationPath) { value in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                sounds.fileName = nextDoubleText
                                sounds.playSound()
                            }
                        }
                } else {
                    PracticeView(navigationPath: $navigationPath, selectedLevel: $selectedLevel, nextText: $nextText, isVibration: $isVibration, text: hiragana)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                sounds.fileName = hiragana
                                sounds.playSound()
                            }
                        }
                        .onChange(of: navigationPath) { value in
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                sounds.fileName = nextText
                                sounds.playSound()
                            }
                        }
                }
            }
            .navigationDestination(for: TappedButtons.self) { button in
                SettingView(navigationPath: $navigationPath, isVibration: $isVibration, isBGMPlay: $isBGMPlay)
            }
        }
        .onAppear {
            if isBGMPlay {
                bgmViewModel.playSound()
            } else {
                bgmViewModel.stopSound()
            }
        }
        .onChange(of: isBGMPlay) { value in
            if isBGMPlay {
                bgmViewModel.playSound()
            } else {
                bgmViewModel.stopSound()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
