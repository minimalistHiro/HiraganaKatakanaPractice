//
//  Pronunciation.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI
import AVFoundation

class Pronunciation: NSObject {
    var fileName: String = ""
    var player: AVAudioPlayer!
    
    func playSound() {
        do {
            player = try AVAudioPlayer(data: NSDataAsset(name: "\(fileName)")!.data)
//            player.stop()
//            player.currentTime = 0.0
            player.play()
        } catch {
            print("音の再生に失敗しました。")
        }
    }
}

