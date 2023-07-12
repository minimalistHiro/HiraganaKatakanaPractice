//
//  PracticeView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI

struct PracticeView: View {
    var setting = Setting()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
    @State private var endedDrawPoints: [DrawPoints] = []       // ペンで描いた座標を格納
    let text: String
    var list: [String] {
        switch selectedLevel {
        case 1:
            return setting.hiraganaList
        case 2:
            return setting.hiraganaSonantList
        default:
            return setting.hiraganaList
        }
    }
    
    var body: some View {
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
                Button {
                    
                } label: {
                    Image(systemName: "waveform")
                        .resizable()
                        .scaledToFit()
                        .frame(width: setting.canvasButtonSize)
                        .foregroundColor(.black)
                }
                .padding(.vertical, 20)
                Button {
                    endedDrawPoints.removeAll()
                } label: {
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: setting.canvasButtonSize)
                        .foregroundColor(.black)
                }
                .padding(.vertical, 20)
            }
            
            Spacer()
            
            // キャンバス
            CanvasView(selectedLevel: $selectedLevel, isDoubleText: $isDoubleText, endedDrawPoints: $endedDrawPoints, text: text)
                .frame(width: setting.canvasSize, height: setting.canvasSize)
            
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
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(2), isDoubleText: .constant(false), text: "が")
    }
}
