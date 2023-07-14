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
    let pronunciation = Pronunciation()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
    @State private var endedDrawPoints1: [DrawPoints] = []          // ペンで描いた座標を格納する変数1
    @State private var endedDrawPoints2: [DrawPoints] = []          // ペンで描いた座標を格納する変数2
    @State private var isShowArrow: Bool = true                     // 書き順矢印の表示有無
    @State private var isShowText: Bool = true                      // テキストの表示有無
    @State private var textDrawCount: Int = 0                       // 2升のうち、何升記入済みかカウント
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
            } else {
                setting.katakanaBackgroundColor
                    .ignoresSafeArea()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    // 発音再生ボタン
                    Button {
                        pronunciation.fileName = text
                        pronunciation.playSound()
                    } label: {
                        Image(systemName: "waveform")
                            .resizable()
                            .scaledToFit()
                            .frame(width: setting.canvasButtonSize)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    // 削除ボタン
                    Button {
                        endedDrawPoints1.removeAll()
                        endedDrawPoints2.removeAll()
                    } label: {
                        Image(systemName: "trash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: setting.canvasButtonSize)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    // 書き順矢印の表示有無ボタン
                    Button {
                        isShowArrow.toggle()
                    } label: {
                        Image(systemName: isShowArrow ?  "arrow.left.arrow.right.circle.fill" : "arrow.left.arrow.right.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: setting.canvasButtonSize)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    // テキストの表示有無ボタン
                    Button {
                        isShowText.toggle()
                    } label: {
                        Circle()
                            .scaledToFit()
                            .frame(width: setting.canvasButtonSize * 1.3)
                            .foregroundColor(isShowText ? .black : .white)
                            .overlay {
                                Text(text)
                                    .font(.system(size: setting.textShowButtonSize * 0.7))
                                    .foregroundColor(isShowText ? .white : .black)
                                    .bold()
                            }
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    // 一つ前のひらがなへ
                    Button {
                        endedDrawPoints1.removeAll()
                        endedDrawPoints2.removeAll()
                        if let index = list.firstIndex(of: text) {
                            navigationPath.removeLast()
                            // 最初の文字"あ"の場合、"ん"を表示。そうでない場合、一つ前のひらがなを表示。
                            if index == 0 {
                                if let last = list.last {
                                    navigationPath.append(last)
                                }
                            } else {
                                navigationPath.append(list[index - 1])
                            }
                        }
                    } label: {
                        Image(systemName: "arrowtriangle.backward.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: setting.canvasButtonSize)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    // キャンバス
                    CanvasView(selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, endedDrawPoints: $endedDrawPoints1, isShowArrow: $isShowArrow, isShowText: $isShowText, text: String(text.prefix(1)))
                        .frame(minWidth: setting.canvasMinSize,
                               maxWidth: setting.canvasMaxSize,
                               minHeight: setting.canvasMinSize,
                               maxHeight: setting.canvasMaxSize)
                        .scaledToFit()
                    
                    CanvasView(selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, endedDrawPoints: $endedDrawPoints2, isShowArrow: $isShowArrow, isShowText: $isShowText, text: String(text.suffix(1)))
                        .frame(minWidth: setting.canvasMinSize,
                               maxWidth: setting.canvasMaxSize,
                               minHeight: setting.canvasMinSize,
                               maxHeight: setting.canvasMaxSize)
                        .scaledToFit()
                    
                    Spacer()
                    
                    // 次のひらがなへ
                    Button {
                        endedDrawPoints1.removeAll()
                        endedDrawPoints2.removeAll()
                        if let index = list.firstIndex(of: text) {
                            navigationPath.removeLast()
                            // 最後の文字"ん"の場合、"あ"を表示。そうでない場合、次のひらがなを表示。
                            if index == list.count - 1 {
                                navigationPath.append(list[0])
                            } else {
                                navigationPath.append(list[index + 1])
                            }
                        }
                    } label: {
                        Image(systemName: "arrowtriangle.right.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: setting.canvasButtonSize)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .onChange(of: endedDrawPoints1) { points in
            if points.count == 1 {
                textDrawCount += 1
            }
            
            // 2升とも記入済みの場合、Modelにクリアしたテキストを保存する。
            if textDrawCount >= 2 {
                addClearedText()
            }
        }
        .onChange(of: endedDrawPoints2) { points in
            if points.count == 1 {
                textDrawCount += 1
            }
            
            // 2升とも記入済みの場合、Modelにクリアしたテキストを保存する。
            if textDrawCount >= 2 {
                addClearedText()
            }
        }
    }
    
    /// Modelにクリアしたテキストを保存する。
    /// - Parameters: なし
    /// - Returns: なし
    private func addClearedText() {
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
        DoubleTextPracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(7), isDoubleText: .constant(true), text: "フォ")
    }
}
