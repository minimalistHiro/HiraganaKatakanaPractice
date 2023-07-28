//
//  FontView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/28.
//

import SwiftUI

struct FontView: View {
    let text: String
    
    var body: some View {
        Image("List\(text)")
            .resizable()
            .scaledToFit()
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView(text: "あ")
    }
}
