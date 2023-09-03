//
//  MaruView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/09/03.
//

import SwiftUI

struct MaruView: View {
    let setting = Setting()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(setting.maru)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            Spacer()
        }
    }
}

struct MaruView_Previews: PreviewProvider {
    static var previews: some View {
        MaruView()
    }
}
