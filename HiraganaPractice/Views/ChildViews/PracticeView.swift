//
//  PracticeView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI
import AVFoundation

struct PracticeView: View {
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
    @State private var endedDrawPoints: [DrawPoints] = []       // ペンで描いた座標を格納
    @State private var savedDrawPoints: [DrawPoints] = []       // 手本実行用に以前の座標を一時的に格納
    @State private var isShowAnExample: Bool = false            // お手本の有無
    @State private var isCheckStart: Bool = false               // 正解チェックスタート有無
    @State private var isOnceShowText: Bool = false             // 一度でもお手本を閲覧したか否か
    @State private var isCorrect: Bool = false                  // 一文字の正解判定後の結果
    @State private var isAllClear: Bool = false                 // 全体の正解判定後の結果
    let text: String                                            // 取得したテキスト1文字
    var list: [String] {
        switch selectedLevel {
        case 1:
            return setting.hiraganaList
        case 2:
            return setting.hiraganaSonantList
        case 5:
            return setting.katakanaList
        case 6:
            return setting.katakanaSonantList
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
            
            HStack {
                Spacer()
                PreviousTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints, endedDrawPoints2: $endedDrawPoints, nextText: $nextText, isShowAnExample: $isShowAnExample, isAllClear: $isAllClear)
                Spacer()
                
                VStack {
                    Spacer()
                    SoundButton(text: text, isVibration: $isVibration, isAllClear: $isAllClear)
                    Spacer()
                    ExampleOperationButton(isVibration: $isVibration, endedDrawPoints: $endedDrawPoints, savedDrawPoints: $savedDrawPoints, isShowAnExample: $isShowAnExample, isAllClear: $isAllClear)
                    Spacer()
                    DeleteButton(isVibration: $isVibration, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints, endedDrawPoints2: $endedDrawPoints, isShowAnExample: $isShowAnExample, isAllClear: $isAllClear)
                    Spacer()
                    DisplayTextButton(text: text, isVibration: $isVibration, isShowArrow: $isShowArrow, isShowText: $isShowText, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints, endedDrawPoints2: $endedDrawPoints, isAllClear: $isAllClear)
                    Spacer()
                }
                Spacer()
                // キャンバス
                CanvasView(selectedLevel: $selectedLevel, endedDrawPoints: $endedDrawPoints, isShowArrow: $isShowArrow, isShowText: $isShowText, isShowAnExample: $isShowAnExample, isCheckStart: $isCheckStart, isOnceShowText: $isOnceShowText, isCorrect: $isCorrect, isAllClear: $isAllClear, text: text)
                    .frame(minWidth: setting.canvasMinSize,
                           maxWidth: setting.canvasMaxSize,
                           minHeight: setting.canvasMinSize,
                           maxHeight: setting.canvasMaxSize)
                Spacer()
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    NextTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, isOnceShowText: $isOnceShowText, endedDrawPoints1: $endedDrawPoints, endedDrawPoints2: $endedDrawPoints, nextText: $nextText, isShowAnExample: $isShowAnExample, isAllClear: $isAllClear)
                    Spacer()
                    CheckStartButton(isVibration: $isVibration, isShowAnExample: $isShowAnExample, isCheckStart1: $isCheckStart, isCheckStart2: $isCheckStart, isAllClear: $isAllClear)
                    Spacer()
                }
                Spacer()
            }
        }
        .onChange(of: isCorrect) { _ in
            // 正解判定実行
            if isCorrect {
                isAllClear = true
                if isOnceShowText || isShowText {
                    addHalfClearedText()
                    sounds.fileName = setting.maruSound
                    sounds.playSound()
                } else {
                    addHalfClearedText()
                    addClearedText()
                    sounds.fileName = setting.hanamaruSound
                    sounds.playSound()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    isAllClear = false
                    isCorrect = false
                }
            }
        }
        .onChange(of: isShowAnExample) { _ in
            // お手本が終了したら、一時的に保存していた以前の手書き座標を返却する。
            if !isShowAnExample {
                endedDrawPoints = savedDrawPoints
            }
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

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(1), nextText: .constant("あ"), isVibration: .constant(true), isShowArrow: .constant(true), isShowText: .constant(true), text: "あ")
    }
}
