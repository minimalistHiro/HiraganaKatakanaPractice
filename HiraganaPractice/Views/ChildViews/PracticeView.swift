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
    
    let textDrawPoints = HiraganaDrawPoints()
    let setting = Setting()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var nextText: String
    @Binding var isVibration: Bool
    @Binding var isShowArrow: Bool
    @Binding var isShowText: Bool
    @State private var endedDrawPoints: [DrawPoints] = []       // ペンで描いた座標を格納
    @State private var savedDrawPoints: [DrawPoints] = []       // 手本実行用に以前の座標を一時的に格納
    @State private var isShowAnExample: Bool = false            // お手本の有無
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
                PreviousTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, endedDrawPoints1: $endedDrawPoints, endedDrawPoints2: $endedDrawPoints, nextText: $nextText, isShowAnExample: $isShowAnExample)
                Spacer()
                
                VStack {
                    Spacer()
                    SoundButton(text: text, isVibration: $isVibration)
                    Spacer()
                    ExampleOperationButton(isVibration: $isVibration, endedDrawPoints: $endedDrawPoints, savedDrawPoints: $savedDrawPoints, isShowAnExample: $isShowAnExample)
                    Spacer()
                    DeleteButton(isVibration: $isVibration, endedDrawPoints1: $endedDrawPoints, endedDrawPoints2: $endedDrawPoints, isShowAnExample: $isShowAnExample)
                    Spacer()
                    DisplayTextButton(text: text, isVibration: $isVibration, isShowArrow: $isShowArrow, isShowText: $isShowText)
                    Spacer()
                }
                Spacer()
                // キャンバス
                CanvasView(selectedLevel: $selectedLevel, endedDrawPoints: $endedDrawPoints, isShowArrow: $isShowArrow, isShowText: $isShowText, isShowAnExample: $isShowAnExample, text: text)
                    .frame(minWidth: setting.canvasMinSize,
                           maxWidth: setting.canvasMaxSize,
                           minHeight: setting.canvasMinSize,
                           maxHeight: setting.canvasMaxSize)
                Spacer()
                NextTextButton(text: text, list: list, navigationPath: $navigationPath, isVibration: $isVibration, endedDrawPoints1: $endedDrawPoints, endedDrawPoints2: $endedDrawPoints, nextText: $nextText, isShowAnExample: $isShowAnExample)
                Spacer()
            }
        }
        .onChange(of: endedDrawPoints) { points in
            // 升に記入、且つそれが手本実行時でない場合のみ実行。
            if points.count == 1 && !isShowAnExample {
                if isShowText {
                    addHalfClearedText()
                } else {
                    addHalfClearedText()
                    addClearedText()
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
        PracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(6), nextText: .constant("あ"), isVibration: .constant(true), isShowArrow: .constant(true), isShowText: .constant(true), text: "ボ")
    }
}
