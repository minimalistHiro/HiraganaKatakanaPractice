//
//  DoubleTextPracticeView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI

struct DoubleTextPracticeView: View {
    var setting = Setting()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
    @State private var endedDrawPoints1: [DrawPoints] = []       // ペンで描いた座標を格納する変数1
    @State private var endedDrawPoints2: [DrawPoints] = []       // ペンで描いた座標を格納する変数2
    let text: String
    var list: [String] {
        switch selectedLevel {
        case 3:
            return setting.hiraganaDiphthongList
        case 4:
            return setting.hiraganaDiphthongSonantList
        default:
            return setting.hiraganaList
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                
                // ボタン
                Button {
                    
                } label: {
                    Image(systemName: "waveform")
                        .resizable()
                        .scaledToFit()
                        .frame(width: setting.canvasButtonSize)
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 20)
                .rotationEffect(Angle(degrees: 270))
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
                .padding(.horizontal, 20)
                .rotationEffect(Angle(degrees: 270))
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
                        .rotationEffect(Angle(degrees: 270))
                }
                
                Spacer()
                
                // キャンバス
                CanvasView(selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, endedDrawPoints: $endedDrawPoints1, text: String(text.prefix(1)))
                    .frame(width: setting.canvasSize, height: setting.canvasSize)
                    .rotationEffect(Angle(degrees: 270))
                CanvasView(selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, endedDrawPoints: $endedDrawPoints2, text: String(text.suffix(1)))
                    .frame(width: setting.canvasSize, height: setting.canvasSize)
                    .rotationEffect(Angle(degrees: 270))
                
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
                        .rotationEffect(Angle(degrees: 270))
                }
                
                Spacer()
            }
        }
    }
}

struct DoubleTextPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleTextPracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(4), isDoubleText: .constant(true), text: "じゅ")
    }
}
