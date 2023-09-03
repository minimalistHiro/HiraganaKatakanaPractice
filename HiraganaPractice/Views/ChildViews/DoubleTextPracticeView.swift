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
                    SoundButton(text: text, isVibration: $isVibration)
                    Spacer()
                    DeleteButton(isVibration: $isVibration, endedDrawPoints1: $endedDrawPoints1, endedDrawPoints2: $endedDrawPoints2, isShowAnExample: $isShowAnExample)
                    Spacer()
                    DisplayTextButton(text: text, isVibration: $isVibration, isShowArrow: $isShowArrow, isShowText: $isShowText)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    PreviousTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, endedDrawPoints1: $endedDrawPoints1, endedDrawPoints2: $endedDrawPoints2, nextText: $nextText, isShowAnExample: $isShowAnExample)
                    Spacer()
                    // キャンバス1
                    CanvasView(selectedLevel: $selectedLevel, endedDrawPoints: $endedDrawPoints1, isShowArrow: $isShowArrow, isShowText: $isShowText, isShowAnExample: $isShowAnExample, text: String(text.prefix(1)))
                        .frame(minWidth: setting.canvasMinSize,
                               maxWidth: setting.canvasMaxSize,
                               minHeight: setting.canvasMinSize,
                               maxHeight: setting.canvasMaxSize)
                        .scaledToFit()
                    // キャンバス2
                    CanvasView(selectedLevel: $selectedLevel, endedDrawPoints: $endedDrawPoints2, isShowArrow: $isShowArrow, isShowText: $isShowText, isShowAnExample: $isShowAnExample, text: String(text.suffix(1)))
                        .frame(minWidth: setting.canvasMinSize,
                               maxWidth: setting.canvasMaxSize,
                               minHeight: setting.canvasMinSize,
                               maxHeight: setting.canvasMaxSize)
                        .scaledToFit()
                    
                    Spacer()
                    NextTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, endedDrawPoints1: $endedDrawPoints1, endedDrawPoints2: $endedDrawPoints2, nextText: $nextText, isShowAnExample: $isShowAnExample)
                    Spacer()
                }
                Spacer()
            }
        }
        .onChange(of: endedDrawPoints1) { points in
            drawingAction(points)
        }
        .onChange(of: endedDrawPoints2) { points in
            drawingAction(points)
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
    
    /// ペンで描いた際にModelにクリアしたか否かの情報を保存する処理。
    /// - Parameters:
    ///   - points: 参照する座標データ
    /// - Returns: なし
    private func drawingAction(_ points: [DrawPoints]) {
        if points.count == 1 {
            textDrawCount += 1
            // お手本なしで書いた場合、専用変数に1加える。
            if !isShowText {
                textNotShowDrawCount += 1
            }
        }
        
        // 2升とも記入済みの場合、Modelにクリアしたテキストを保存する。
        if textDrawCount == 2 {
            // 2升ともお手本なしで書いた場合、クリア。それ以外の場合、ハーフクリア。
            if textNotShowDrawCount == 2 {
                addHalfClearedText()
                addClearedText()
            } else {
                addHalfClearedText()
            }
            // 再度テキストをModelに保存しないように、何升記入済みかのカウントを初期化する。
            textDrawCount = 0
            textNotShowDrawCount = 0
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
        DoubleTextPracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(7), nextText: .constant("きゃ"), isVibration: .constant(true), isShowArrow: .constant(true), isShowText: .constant(true), text: "きゃ")
    }
}
