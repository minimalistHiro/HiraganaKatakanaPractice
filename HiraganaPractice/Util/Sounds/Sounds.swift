//
//  Pronunciation.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/12.
//

import SwiftUI
import AVFoundation

class Sounds: NSObject {
    var fileName: String = ""
    var player: AVAudioPlayer!
    var data = Data()
    
    func playSound() {
        data = NSDataAsset(name: "\(fileName)")?.data ?? Data()
        do {
            player = try AVAudioPlayer(data: data)
            player.stop()
            player.currentTime = 0.0
            player.volume = 1.0
            player.play()
        } catch {
            print("音の再生に失敗しました。")
        }
    }
}

