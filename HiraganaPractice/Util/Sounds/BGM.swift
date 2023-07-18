//
//  BGM.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/16.
//

import SwiftUI
import AVFoundation

class BGM: NSObject, ObservableObject {
    static var shared: BGM = BGM()
    
    var data = NSDataAsset(name: "JapanBGM")!.data
    var player: AVAudioPlayer!
    
    // BGM再生
    func playSound() {
        do {
            player = try AVAudioPlayer(data: data)
            player.volume = 0.2
            player.numberOfLoops = -1
            player.play()
        } catch {
            print("音の再生に失敗しました。")
        }
    }
    
    // BGM停止
    func stopSound() {
        player?.stop()
    }
}
