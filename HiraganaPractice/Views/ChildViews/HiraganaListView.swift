//
//  HiraganaListView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI

struct HiraganaListView: View {
    let setting = Setting()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
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
        LazyHGrid(rows: Array(repeating: GridItem(), count: 5)) {
            ForEach(list, id: \.self) { text in
                NavigationLink(value: text) {
                    if text != "" {
                        Rectangle()
                            .stroke(lineWidth: 3)
                            .frame(width: 50, height: 50)
                            .overlay {
                                Text(text)
                                    .font(.mincho(ofSize: isDoubleText ? 25 : 40))
                            }
                    }
                }
                .foregroundColor(.black)
            }
        }
    }
}

struct HiraganaListView_Previews: PreviewProvider {
    static var previews: some View {
        HiraganaListView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(1), isDoubleText: .constant(false))
    }
}
