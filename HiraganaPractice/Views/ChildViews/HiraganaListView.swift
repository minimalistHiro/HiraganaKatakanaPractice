//
//  HiraganaListView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/08.
//

import SwiftUI

struct HiraganaListView: View {
    var setting = Setting()
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
        default:
            return setting.hiraganaReverseList
        }
    }
    
    var body: some View {
        LazyHGrid(rows: Array(repeating: GridItem(), count: 5)) {
            ForEach(list, id: \.self) { text in
                NavigationLink(value: text) {
                    if text != "" {
                        Circle()
                            .stroke(lineWidth: 3)
                            .frame(width: 50)
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
        HiraganaListView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(4), isDoubleText: .constant(true))
    }
}
