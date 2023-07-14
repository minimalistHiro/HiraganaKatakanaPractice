//
//  LevelButtonView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/13.
//

import SwiftUI

struct LevelButtonView: View {
    let level: Int
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            Capsule()
                .foregroundColor(backgroundColor)
                .frame(width: 180, height: 45)
                .overlay {
                    Capsule()
                        .stroke(lineWidth: 4)
                        .foregroundColor(.black)
                }
                .overlay {
                    Text("Level \(level)")
                }
                .shadow(radius: 5, x: 0, y: 4)
            HStack {
                Image("Hanamaru")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                // 右側にスペースを開けるために、透明の適当なイメージをセット。
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.clear)
                    .frame(width: 160)
            }
        }
    }
}

struct LevelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LevelButtonView(level: 1, backgroundColor: .yellow)
    }
}
