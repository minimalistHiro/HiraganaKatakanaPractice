//
//  Sound.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/16.
//

import SwiftUI
import AVFoundation

class Sound: NSObject {
    let data = NSDataAsset(name: "AlertSounds")!.data
    var player: AVAudioPlayer!
    
    func playSound() {
        do {
            player = try AVAudioPlayer(data: data)
            player.stop()
            player.currentTime = 0.0
            player.play()
        } catch {
            print("音の再生に失敗しました。")
        }
    }
}
