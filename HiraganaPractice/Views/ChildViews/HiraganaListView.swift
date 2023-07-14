//
//  HiraganaListView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI

struct HiraganaListView: View {
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var data: FetchedResults<Entity>
    
    let setting = Setting()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
//    @State private var backgroundColor: Color = .white
    @State private var clearedTextCount: Int = 0            // クリアしたテキスト数
    var list: [String] {
        switch selectedLevel {
        case 1:
            return setting.hiraganaReverseList
        case 2:
            return setting.hiraganaSonantReverseList
        case 3:
            return setting.hiraganaDiphthongReverseList
        case 4:
            return setting.hiraganaDiphthongSonantReverseList
        case 5:
            return setting.katakanaReverseList
        case 6:
            return setting.katakanaSonantReverseList
        case 7:
            return setting.katakanaDiphthongReverseList
        case 8:
            return setting.katakanaDiphthongSonantReverseList
        default:
            return setting.hiraganaReverseList
        }
    }                   // 選択されたレベルによって、表示するテキスト一覧を変える
    
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
            
            LazyHGrid(rows: Array(repeating: GridItem(), count: 5)) {
                ForEach(list, id: \.self) { text in
                    NavigationLink(value: text) {
                        if text != "" {
                            ZStack {
                                Rectangle()
                                    .stroke(lineWidth: 3)
                                    .frame(width: 50, height: 50)
                                    .overlay {
                                        Text(text)
                                            .font(.mincho(ofSize: isDoubleText ? 25 : 40))
                                    }
                                    .overlay {
                                        if checkCleared(text) {
                                            HanamaruView()
                                        }
                                    }
                                    .background(checkCleared(text) ? setting.clearedTextBackgroundColor : Color(.white))
                            }
                        }
                    }
                    .foregroundColor(.black)
                }
            }
        }
        .onAppear {
            countClearedText()
        }
    }
    
    /// 指定のテキストがクリアしたテキストとしてModelに保存されているかチェック。
    /// - Parameters:
    ///   - text: 検索するテキスト
    /// - Returns:　指定のテキストがクリアしたテキストとして保存されていたらtrue、見つからなかった場合false。
    private func checkCleared(_ text: String) -> Bool {
        for data in data {
            if data.clearedText == text {
                return true
            }
        }
        return false
    }
    
    private func countClearedText() {
        for data in data {
            if let text = data.clearedText {
                // モデルに保存済みのテキストが選択したレベルのテキストに含まれていた場合、カウントを1加える。
                if list.contains(text) {
                    clearedTextCount += 1
                    print(clearedTextCount)
                }
            }
        }
    }
}

struct HiraganaListView_Previews: PreviewProvider {
    static var previews: some View {
        HiraganaListView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(1), isDoubleText: .constant(false))
    }
}
