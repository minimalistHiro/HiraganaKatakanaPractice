//
//  LevelButtonView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/13.
//

import SwiftUI

struct LevelButtonView: View {
    @FetchRequest(sortDescriptors: [])
    var data: FetchedResults<Entity>
    
    let setting = Setting()
    let level: Int
    let backgroundColor: Color
    
    var body: some View {
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
            .overlay {
                HStack {
                    // クリア済みのレベルのみ、はなまるをつける。
                    if checkPerfectClearedLevel() {
                        Image(setting.hanamaru)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                        // 右側にスペースを開けるために、透明の適当なイメージをセット。
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.clear)
                            .frame(width: 160)
                    } else if checkClearedLevel() {
                        Image(setting.maru)
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
    
    /// 指定のレベルがパーフェクトしたレベルとしてModelに保存されているかチェック。
    /// - Parameters: なし
    /// - Returns:　指定のレベルがパーフェクトしたレベルとして保存されていたらtrue、見つからなかった場合false。
    private func checkPerfectClearedLevel() -> Bool {
        for data in data {
            if data.perfectClearedLevel == Int32(level) {
                return true
            }
        }
        return false
    }
    
    /// 指定のレベルがクリアしたレベルとしてModelに保存されているかチェック。
    /// - Parameters: なし
    /// - Returns:　指定のレベルがクリアしたレベルとして保存されていたらtrue、見つからなかった場合false。
    private func checkClearedLevel() -> Bool {
        for data in data {
            if data.clearedLevel == Int32(level) {
                return true
            }
        }
        return false
    }
}

struct LevelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LevelButtonView(level: 1, backgroundColor: .yellow)
    }
}
