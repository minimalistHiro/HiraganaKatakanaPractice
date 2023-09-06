//
//  DoubleTextPracticeView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI
import AVFoundation

struct DoubleTextPracticeView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var data: FetchedResults<Entity>
    
    let setting = Setting()
    let sounds = Sounds()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var nextText: String
    @Binding var isVibration: Bool
    @Binding var isShowArrow: Bool
    @Binding var isShowText: Bool
    @State private var endedDrawPoints1: [DrawPoints] = []          // ペンで描いた座標を格納する変数1
    @State private var endedDrawPoints2: [DrawPoints] = []          // ペンで描いた座標を格納する変数2
    @State private var isShowAnExample: Bool = false                // お手本の有無
    @State private var textDrawCount: Int = 0                       // 2升のうち、何升記入済みかカウント
    @State private var textNotShowDrawCount: Int = 0                // 2升のうち、何升お手本なしで記入済みかカウント
    @State private var isCheckStart1: Bool = false                  // 正解チェックスタート有無1
    @State private var isCheckStart2: Bool = false                  // 正解チェックスタート有無2
    @State private var isOnceShowText: Bool = false                 // 一度でもお手本を閲覧したか否か
    @State private var isCorrect1: Bool = false                     // 一文字の正解判定後の結果1
    @State private var isCorrect2: Bool = false                     // 一文字の正解判定後の結果2
    @State private var isAllClear: Bool = false                     // 全体の正解判定後の結果
    static var canvasGetSize: CGFloat = .zero                       // canvasの取得サイズ
    let text: String                                                // 取得したテキスト2文字
    var list: [String] {
        switch selectedLevel {
        case 3:
            return setting.hiraganaDiphthongList
        case 4:
            return setting.hiraganaDiphthongSonantList
        case 7:
            return setting.katakanaDiphthongList
        case 8:
            return setting.katakanaDiphthongSonantList
        default:
            return setting.hiraganaList
        }
    }
    
    var body: some View {
        ZStack {
            // 背景色。ひらがなモードとカタカナモードで色を分ける。
            if selectedLevel <= 4 {
                setting.hiraganaBackgroundColor
                    .ignoresSafeArea()
                    .overlay {
                        if isShowAnExample {
                            Color(white: 0.7, opacity: 0.5)
                                .ignoresSafeArea()
                        }
                    }
            } else {
                setting.katakanaBackgroundColor
                    .ignoresSafeArea()
                    .overlay {
                        if isShowAnExample {
                            Color(white: 0.7, opacity: 0.5)
                                .ignoresSafeArea()
                        }
                    }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    SoundButton(text: text, isVibration: $isVibration, isAllClear: $isAllClear)
                    Spacer()
                    DeleteButton(isVibration: $isVibration, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints1, endedDrawPoints2: $endedDrawPoints2, isShowAnExample: $isShowAnExample, isAllClear: $isAllClear)
                    Spacer()
                    DisplayTextButton(text: text, isVibration: $isVibration, isShowArrow: $isShowArrow, isShowText: $isShowText, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints1, endedDrawPoints2: $endedDrawPoints2, isAllClear: $isAllClear)
                    Spacer()
                    CheckStartButton(isVibration: $isVibration, isShowAnExample: $isShowAnExample, isCheckStart1: $isCheckStart1, isCheckStart2: $isCheckStart2, isAllClear: $isAllClear)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    PreviousTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints1, endedDrawPoints2: $endedDrawPoints2, nextText: $nextText, isShowAnExample: $isShowAnExample, isAllClear: $isAllClear)
                    Spacer()
                    // キャンバス1
                    CanvasView(selectedLevel: $selectedLevel, endedDrawPoints: $endedDrawPoints1, isShowArrow: $isShowArrow, isShowText: $isShowText, isShowAnExample: $isShowAnExample, isCheckStart: $isCheckStart1, isOnceShowText: $isOnceShowText, isCorrect: $isCorrect1, isAllClear: $isAllClear, text: String(text.prefix(1)))
                        .frame(minWidth: setting.canvasMinSize,
                               maxWidth: setting.canvasMaxSize,
                               minHeight: setting.canvasMinSize,
                               maxHeight: setting.canvasMaxSize)
                        .scaledToFit()
                    // キャンバス2
                    CanvasView(selectedLevel: $selectedLevel, endedDrawPoints: $endedDrawPoints2, isShowArrow: $isShowArrow, isShowText: $isShowText, isShowAnExample: $isShowAnExample, isCheckStart: $isCheckStart2, isOnceShowText: $isOnceShowText, isCorrect: $isCorrect2, isAllClear: $isAllClear, text: String(text.suffix(1)))
                        .frame(minWidth: setting.canvasMinSize,
                               maxWidth: setting.canvasMaxSize,
                               minHeight: setting.canvasMinSize,
                               maxHeight: setting.canvasMaxSize)
                        .scaledToFit()
                    
                    Spacer()
                    NextTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints1, endedDrawPoints2: $endedDrawPoints2, nextText: $nextText, isShowAnExample: $isShowAnExample, isAllClear: $isAllClear)
                    Spacer()
                }
                Spacer()
            }
        }
        .onChange(of: isCorrect1) { isCorrect in
            saveCorrectData(isCorrect)
        }
        .onChange(of: isCorrect2) { isCorrect in
            saveCorrectData(isCorrect)
        }
        // 戻るボタンを独自実装
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    navigationPath.removeLast()
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .bold()
                }
                .padding()
            }
        }
    }
    
    /// Modelにクリアしたか否かの情報を保存する処理。
    /// - Parameters:
    ///   - isCorrect: 参照する座標データ
    /// - Returns: なし
    private func saveCorrectData(_ isCorrect: Bool) {
        if isCorrect {
            textDrawCount += 1
            // お手本なしで書いた場合、変数に1加える。
            if !isOnceShowText && !isShowText {
                textNotShowDrawCount += 1
            }
        }
        
        // 2升とも記入済みの場合、ModelにYクリアしたテキストを保存する。
        if textDrawCount == 2 {
            isAllClear = true
            // 2升ともお手本なしで書いた場合、クリア。それ以外の場合、ハーフクリア。
            if textNotShowDrawCount == 2 {
                addHalfClearedText()
                addClearedText()
                sounds.fileName = setting.hanamaruSound
                sounds.playSound()
            } else {
                addHalfClearedText()
                sounds.fileName = setting.maruSound
                sounds.playSound()
            }
            // 再度テキストをModelに保存しないように、何升記入済みかのカウントを初期化する。
            textDrawCount = 0
            textNotShowDrawCount = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                isAllClear = false
                isCorrect1 = false
                isCorrect2 = false
            }
        }
    }
    
    /// Modelにハーフクリアしたテキストを保存する。
    /// - Parameters: なし
    /// - Returns: なし
    private func addHalfClearedText() {
        // テキストがクリア済みの場合、returnする。
        for data in data {
            if data.halfClearedText == text {
                return
            }
        }
        
        let newText = Entity(context: viewContext)
        newText.halfClearedText = text
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
    
    /// Modelにクリアしたテキストを保存する。
    /// - Parameters: なし
    /// - Returns: なし
    private func addClearedText() {
        // テキストがクリア済みの場合、returnする。
        for data in data {
            if data.clearedText == text {
                return
            }
        }
        
        let newText = Entity(context: viewContext)
        newText.clearedText = text
        do {
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
}

struct DoubleTextPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTextPracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(3), nextText: .constant("きゃ"), isVibration: .constant(true), isShowArrow: .constant(true), isShowText: .constant(true), text: "きゃ")
    }
}
