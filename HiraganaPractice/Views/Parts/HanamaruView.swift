//
//  HanamaruView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/14.
//

import SwiftUI

struct HanamaruView: View {
    let setting = Setting()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(setting.hanamaru)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            Spacer()
        }
    }
}

struct HanamaruView_Previews: PreviewProvider {
    static var previews: some View {
        HanamaruView()
    }
}
