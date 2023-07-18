//
//  UserProfile.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/17.
//

import SwiftUI

class UserProfile: ObservableObject {
    
    /// BGM再生の有無
    @Published var isBGMPlay: Bool {
        didSet {
            UserDefaults.standard.set(isBGMPlay, forKey: "isBGMPlay")
        }
    }
    /// バイブレーションの有無
    @Published var isVibration: Bool {
        didSet {
            UserDefaults.standard.set(isVibration, forKey: "isVibration")
        }
    }
    /// 初期化処理
    init() {
        isBGMPlay = UserDefaults.standard.bool(forKey: "isBGMPlay")
        isVibration = UserDefaults.standard.bool(forKey: "isVibration")
    }
}

