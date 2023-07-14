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
    let pronunciation = Pronunciation()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
    @State private var endedDrawPoints: [DrawPoints] = []       // ペンで描いた座標を格納
    @State private var isShowArrow: Bool = true                 // 書き順矢印の表示有無
    @State private var isShowText: Bool = true                  // テキストの表示有無
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
            } else {
                setting.katakanaBackgroundColor
                    .ignoresSafeArea()
            }
            
            HStack {
                Spacer()
                
                // 一つ前のひらがなへ
                Button {
                    endedDrawPoints.removeAll()
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
                
                // ボタン
                VStack {
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
                        endedDrawPoints.removeAll()
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
                                    .font(.system(size: setting.textShowButtonSize))
                                    .foregroundColor(isShowText ? .white : .black)
                                    .bold()
                            }
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                // キャンバス
                CanvasView(selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, endedDrawPoints: $endedDrawPoints, isShowArrow: $isShowArrow, isShowText: $isShowText, text: text)
                    .frame(minWidth: setting.canvasMinSize,
                           maxWidth: setting.canvasMaxSize,
                           minHeight: setting.canvasMinSize,
                           maxHeight: setting.canvasMaxSize)
                
                Spacer()
                
                // 次のひらがなへ
                Button {
                    endedDrawPoints.removeAll()
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
        }
        .onChange(of: endedDrawPoints) { points in
            if points.count == 1 {
                print("created")
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

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(5), isDoubleText: .constant(false), text: "ン")
    }
}
