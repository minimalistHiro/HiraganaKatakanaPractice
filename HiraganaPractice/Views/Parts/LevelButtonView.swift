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
    }
}

struct LevelButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LevelButtonView(level: 1, backgroundColor: .yellow)
    }
}
