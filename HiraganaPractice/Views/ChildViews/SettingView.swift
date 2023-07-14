//
//  SettingView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/14.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        NavigationStack {
            List {
                Button {
                    
                } label: {
                    Text("データの削除")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
