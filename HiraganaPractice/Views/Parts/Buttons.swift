//
//  Buttons.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/08/31.
//

import SwiftUI

// 発音再生ボタン
struct SoundButton: View {
    let setting = Setting()
    let sounds = Sounds()
    let text: String
    @Binding var isVibration: Bool
    @Binding var isAllClear: Bool
    
    var body: some View {
        Button {
            if isVibration {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            sounds.fileName = text
            sounds.playSound()
        } label: {
            Image(systemName: "waveform")
                .resizable()
                .scaledToFit()
                .frame(width: setting.canvasButtonSize)
                .foregroundColor(.black)
        }
        .disabled(isAllClear ? true : false)
    }
}

// お手本実行ボタン
struct ExampleOperationButton: View {
    let setting = Setting()
    @Binding var isVibration: Bool
    @Binding var endedDrawPoints: [DrawPoints]
    @Binding var savedDrawPoints: [DrawPoints]
    @Binding var isShowAnExample: Bool
    @Binding var isAllClear: Bool
    
    var body: some View {
        Button {
            savedDrawPoints = endedDrawPoints
            endedDrawPoints.removeAll()
            if isVibration {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            isShowAnExample = true
        } label: {
            Image(systemName: "play.circle")
                .resizable()
                .scaledToFit()
                .frame(width: setting.canvasButtonSize)
                .foregroundColor(.black)
        }
        .disabled((isShowAnExample || isAllClear) ? true : false)
    }
}


// 削除ボタン
struct DeleteButton: View {
    let setting = Setting()
    @Binding var isVibration: Bool
    @Binding var isOnceShowText: Bool
    @Binding var endedDrawPoints1: [DrawPoints]
    @Binding var endedDrawPoints2: [DrawPoints]
    @Binding var isShowAnExample: Bool
    @Binding var isAllClear: Bool
    
    var body: some View {
        Button {
            if isVibration {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            endedDrawPoints1.removeAll()
            endedDrawPoints2.removeAll()
            isOnceShowText = false
            isShowAnExample = false
        } label: {
            Image(systemName: "trash")
                .resizable()
                .scaledToFit()
                .frame(width: setting.canvasButtonSize)
                .foregroundColor(.black)
        }
        .disabled((isShowAnExample || isAllClear) ? true : false)
    }
}

// テキスト、矢印の表示有無ボタン
struct DisplayTextButton: View {
    let setting = Setting()
    let text: String
    @Binding var isVibration: Bool
    @Binding var isShowArrow: Bool
    @Binding var isShowText: Bool
    @Binding var isOnceShowText: Bool
    @Binding var endedDrawPoints1: [DrawPoints]
    @Binding var endedDrawPoints2: [DrawPoints]
    @Binding var isAllClear: Bool
    
    var body: some View {
        Button {
            if isVibration {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            isShowArrow.toggle()
            isShowText.toggle()
            // 一度でもキャンバスに書いた上で、お手本を表示したら、お手本を閲覧したことにする。
            if (endedDrawPoints1.count > 0 || endedDrawPoints2.count > 0) {
                isOnceShowText = true
            }
        } label: {
            Circle()
                .scaledToFit()
                .frame(width: setting.canvasButtonSize * 1.3)
                .foregroundColor(isShowText ? .black : .white)
                .overlay {
                    Text(text)
                        .font(.system(size: text.count >= 2 ? setting.textShowButtonSize * 0.7 : setting.textShowButtonSize))
                        .foregroundColor(isShowText ? .white : .black)
                        .bold()
                }
        }
        .disabled(isAllClear ? true : false)
    }
}

// 次のテキストへ
struct NextTextButton: View {
    let setting = Setting()
    let text: String
    let list: [String]
    @Binding var navigationPath: NavigationPath
    @Binding var isVibration: Bool
    @Binding var isOnceShowText: Bool
    @Binding var endedDrawPoints1: [DrawPoints]
    @Binding var endedDrawPoints2: [DrawPoints]
    @Binding var nextText: String
    @Binding var isShowAnExample: Bool
    @Binding var isAllClear: Bool
    
    var body: some View {
        Button {
            if isVibration {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            endedDrawPoints1.removeAll()
            endedDrawPoints2.removeAll()
            isOnceShowText = false
            isShowAnExample = false
            if let index = list.firstIndex(of: text) {
                navigationPath.removeLast()
                // 最後のテキストの場合、最初のテキストを表示。そうでない場合、次のテキストを表示。
                if index == list.count - 1 {
                    nextText = list[0]
                    navigationPath.append(nextText)
                } else {
                    nextText = list[index + 1]
                    navigationPath.append(nextText)
                }
            }
        } label: {
            Image(systemName: "arrowtriangle.right.fill")
                .resizable()
                .scaledToFit()
                .frame(width: setting.canvasButtonSize)
                .foregroundColor(.black)
        }
        .disabled((isShowAnExample || isAllClear) ? true : false)
    }
}

// 前のテキストへ
struct PreviousTextButton: View {
    let setting = Setting()
    let text: String
    let list: [String]
    @Binding var navigationPath: NavigationPath
    @Binding var isVibration: Bool
    @Binding var isOnceShowText: Bool
    @Binding var endedDrawPoints1: [DrawPoints]
    @Binding var endedDrawPoints2: [DrawPoints]
    @Binding var nextText: String
    @Binding var isShowAnExample: Bool
    @Binding var isAllClear: Bool
    
    var body: some View {
        Button {
            if isVibration {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            endedDrawPoints1.removeAll()
            endedDrawPoints2.removeAll()
            isOnceShowText = false
            isShowAnExample = false
            if let index = list.firstIndex(of: text) {
                navigationPath.removeLast()
                // 最初のテキストの場合、最後のテキストを表示。そうでない場合、一つ前のテキストを表示。
                if index == 0 {
                    if let last = list.last {
                        nextText = last
                        navigationPath.append(nextText)
                    }
                } else {
                    nextText = list[index - 1]
                    navigationPath.append(nextText)
                }
            }
        } label: {
            Image(systemName: "arrowtriangle.backward.fill")
                .resizable()
                .scaledToFit()
                .frame(width: setting.canvasButtonSize)
                .foregroundColor(.black)
        }
        .disabled((isShowAnExample || isAllClear) ? true : false)
    }
}

// 正解チェックスタートボタン
struct CheckStartButton: View {
    let setting = Setting()
    let sounds = Sounds()
    @Binding var isVibration: Bool
    @Binding var isShowAnExample: Bool
    @Binding var isCheckStart1: Bool
    @Binding var isCheckStart2: Bool
    @Binding var isAllClear: Bool
    
    var body: some View {
        Button {
            if isVibration {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
            }
            Task {
                isCheckStart1 = true
                try? await Task.sleep(nanoseconds: 0_300_000_000)
                isCheckStart2 = true
                try? await Task.sleep(nanoseconds: 0_100_000_000)
                // ハズレの場合、バツの音を鳴らす。
                if !isAllClear {
                    sounds.fileName = setting.batsuSound
                    sounds.playSound()
                }
            }
        } label: {
            Circle()
                .scaledToFit()
                .frame(width: setting.canvasButtonSize * 1.3)
                .foregroundColor(isShowAnExample ? .gray : .red)
                .shadow(radius: 3, x: 0, y: 3)
                .overlay {
                    Image(systemName: "checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: setting.canvasButtonSize * 0.6)
                        .foregroundColor(.white)
                        .bold()
                }
        }
        .disabled((isShowAnExample || isAllClear) ? true : false)
    }
}
