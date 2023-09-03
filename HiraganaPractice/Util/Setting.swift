//
//  Data.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/07.
//

import SwiftUI

// 各種設定
final class Setting {
    // Viewのサイズ
    let canvasMaxSize: CGFloat = 300                        // Canvasの最大サイズ
    let canvasMinSize: CGFloat = 150                        // Canvasの最小サイズ
    let canvasBorderWidth: CGFloat = 2                      // Canvasのフレーム太さ
    let canvasButtonSize: CGFloat = 35                      // Canvasボタンサイズ
    let textShowButtonSize: CGFloat = 25                    // テキストの表示有無のボタンサイズ
    
    // ユーザーインターフェース
    let largeTextCanvasLineWidth: CGFloat = 15              // 大きい文字の線の太さ
    let smallTextCanvasLineWidth: CGFloat = 10              // 小さい文字の線の太さ
    
    // カラー
    // 背景色
    let topViewBackgroundColor: Color = Color("TopViewBackgroundColor")         // トップ画面
    let hiraganaBackgroundColor: Color = Color("HiraganaBackgroundColor")       // ひらがな
    let katakanaBackgroundColor: Color = Color("KatakanaBackgroundColor")       // カタカナ
    let clearedTextBackgroundColor: Color = Color("ClearedTextBackgroundColor") // クリア後のテキスト
    let halfClearedTextBackgroundColor: Color = Color("HalfClearedTextBackgroundColor") // ハーフクリア後のテキスト
    let yellowModeBackgroundColor: Color = Color("YellowModeBackgroundColor")   // イエローモードの背景色
    
    // 画像名
    let maru: String = String("Maru")                       // 丸
    let hanamaru: String = String("Hanamaru")               // はなまる
    
    // サウンド名
    let yellowModeAlertSound: String = String("Success")    // イエローモード発動のアラート音
    let eraserSound: String = String("Cancel")              // 消しゴム音
    
    // ひらがな50音
    let hiraganaList: [String] = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "や", "ゆ", "よ", "ら", "り", "る", "れ", "ろ", "わ", "を", "ん"]
    let hiraganaReverseList: [String] = ["ん", "空白1", "空白2", "空白3", "空白4", "わ", "空白5", "空白6", "空白7", "を", "ら", "り", "る", "れ", "ろ", "や", "空白8", "ゆ", "空白9", "よ", "ま", "み", "む", "め", "も", "は", "ひ", "ふ", "へ", "ほ", "な", "に", "ぬ", "ね", "の", "た", "ち", "つ", "て", "と", "さ", "し", "す", "せ", "そ", "か", "き", "く", "け", "こ", "あ", "い", "う", "え", "お"]
    
    // ひらがな濁音
    let hiraganaSonantList: [String] = ["が", "ぎ", "ぐ", "げ", "ご", "ざ", "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"]
    let hiraganaSonantReverseList: [String] = ["ぱ", "ぴ", "ぷ", "ぺ", "ぽ", "ば", "び", "ぶ", "べ", "ぼ", "だ", "ぢ", "づ", "で", "ど", "ざ", "じ", "ず", "ぜ", "ぞ", "が", "ぎ", "ぐ", "げ", "ご"]
    
    // ひらがな拗音
    let hiraganaDiphthongList: [String] = ["きゃ", "きゅ", "きょ", "しゃ", "しゅ", "しょ", "ちゃ", "ちゅ", "ちょ", "にゃ", "にゅ", "にょ", "ひゃ", "ひゅ", "ひょ", "みゃ", "みゅ", "みょ", "りゃ", "りゅ", "りょ"]
    let hiraganaDiphthongReverseList: [String] = ["りゃ", "空白1", "りゅ", "空白2", "りょ", "みゃ", "空白3", "みゅ", "空白4", "みょ", "ひゃ", "空白5", "ひゅ", "空白6", "ひょ", "にゃ", "空白7", "にゅ", "空白8", "にょ", "ちゃ", "空白9", "ちゅ", "空白10", "ちょ", "しゃ", "空白11", "しゅ", "空白12", "しょ", "きゃ", "空白13", "きゅ", "空白14", "きょ"]
    
    // ひらがな拗音濁音
    let hiraganaDiphthongSonantList: [String] = ["ぎゃ", "ぎゅ", "ぎょ", "じゃ", "じゅ", "じょ", "びゃ", "びゅ", "びょ", "ぴゃ", "ぴゅ", "ぴょ"]
    let hiraganaDiphthongSonantReverseList: [String] = ["ぴゃ", "空白1", "ぴゅ", "空白2", "ぴょ", "びゃ", "空白3", "びゅ", "空白4", "びょ", "じゃ", "空白5", "じゅ", "空白6", "じょ", "ぎゃ", "空白7", "ぎゅ", "空白8", "ぎょ"]
    
    // カタカナ50音
    let katakanaList: [String] = ["ア", "イ", "ウ", "エ", "オ", "カ", "キ", "ク", "ケ", "コ", "サ", "シ", "ス", "セ", "ソ", "タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "マ", "ミ", "ム", "メ", "モ", "ヤ", "ユ", "ヨ", "ラ", "リ", "ル", "レ", "ロ", "ワ", "ヲ", "ン"]
    let katakanaReverseList: [String] = ["ン", "空白1", "空白2", "空白3", "空白4", "ワ", "空白5", "空白6", "空白7", "ヲ", "ラ", "リ", "ル", "レ", "ロ", "ヤ", "空白8", "ユ", "空白9", "ヨ", "マ", "ミ", "ム", "メ", "モ", "ハ", "ヒ", "フ", "ヘ", "ホ", "ナ", "ニ", "ヌ", "ネ", "ノ", "タ", "チ", "ツ", "テ", "ト", "サ", "シ", "ス", "セ", "ソ", "カ", "キ", "ク", "ケ", "コ", "ア", "イ", "ウ", "エ", "オ"]
    
    // カタカナ濁音
    let katakanaSonantList: [String] = ["ガ", "ギ", "グ", "ゲ", "ゴ", "ザ", "ジ", "ズ", "ゼ", "ゾ", "ダ", "ヂ", "ヅ", "デ", "ド", "バ", "ビ", "ブ", "ベ", "ボ", "パ", "ピ", "プ", "ペ", "ポ"]
    let katakanaSonantReverseList: [String] = ["パ", "ピ", "プ", "ペ", "ポ", "バ", "ビ", "ブ", "ベ", "ボ", "ダ", "ヂ", "ヅ", "デ", "ド", "ザ", "ジ", "ズ", "ゼ", "ゾ", "ガ", "ギ", "グ", "ゲ", "ゴ"]
    
    // カタカナ拗音
    let katakanaDiphthongList: [String] = ["キャ", "キュ", "キョ", "シャ", "シュ", "ショ", "チャ", "チュ", "チョ", "ニャ", "ニュ", "ニョ", "ヒャ", "ヒュ", "ヒョ", "ミャ", "ミュ", "ミョ", "リャ", "リュ", "リョ"]
    let katakanaDiphthongReverseList: [String] = ["リャ", "空白1", "リュ", "空白2", "リョ", "ミャ", "空白3", "ミュ", "空白4", "ミョ", "ヒャ", "空白5", "ヒュ", "空白6", "ヒョ",  "ニャ", "空白7", "ニュ", "空白8", "ニョ", "チャ", "空白9", "チュ", "空白10", "チョ", "シャ", "空白11", "シュ", "空白12", "ショ", "キャ", "空白13", "キュ", "空白14", "キョ"]
    
    // カタカナ拗音濁音
    let katakanaDiphthongSonantList: [String] = ["ギャ", "ギュ", "ギョ", "ジャ", "ジュ", "ジョ", "ビャ", "ビュ", "ビョ", "ピャ", "ピュ", "ピョ"]
    let katakanaDiphthongSonantReverseList: [String] = ["ピャ", "空白1", "ピュ", "空白2", "ピョ", "ビャ", "空白3", "ビュ", "空白4", "ビョ", "ジャ", "空白5", "ジュ", "空白6", "ジョ", "ギャ", "空白7", "ギュ", "空白8", "ギョ"]
}

