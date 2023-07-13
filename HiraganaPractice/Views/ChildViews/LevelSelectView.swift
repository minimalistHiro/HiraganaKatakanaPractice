//
//  LevelSelectView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/09.
//

import SwiftUI

struct LevelSelectView: View {
    let setting = Setting()
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
    let titleTextSize: CGFloat = 45
    let levelTextSize: CGFloat = 30
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                Group {
                    Text("ひらがな")
                        .font(.mincho(ofSize: titleTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 1
                        isDoubleText = false
                        navigationPath.append(1)
                    } label: {
                        LevelButtonView(level: 1, backgroundColor: setting.hiraganaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 2
                        isDoubleText = false
                        navigationPath.append(2)
                    } label: {
                        LevelButtonView(level: 2, backgroundColor: setting.hiraganaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 3
                        isDoubleText = true
                        navigationPath.append(3)
                    } label: {
                        LevelButtonView(level: 3, backgroundColor: setting.hiraganaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 4
                        isDoubleText = true
                        navigationPath.append(4)
                    } label: {
                        LevelButtonView(level: 4, backgroundColor: setting.hiraganaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
            }
            .foregroundColor(.black)
            
            Spacer()
            
            VStack {
                Spacer()
                
                Group {
                    Text("カタカナ")
                        .font(.mincho(ofSize: titleTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 5
                        isDoubleText = false
                        navigationPath.append(5)
                    } label: {
                        LevelButtonView(level: 1, backgroundColor: setting.katakanaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 6
                        isDoubleText = false
                        navigationPath.append(6)
                    } label: {
                        LevelButtonView(level: 2, backgroundColor: setting.katakanaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 7
                        isDoubleText = true
                        navigationPath.append(7)
                    } label: {
                        LevelButtonView(level: 3, backgroundColor: setting.katakanaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 8
                        isDoubleText = true
                        navigationPath.append(8)
                    } label: {
                        LevelButtonView(level: 4, backgroundColor: setting.katakanaBackgroundColor)
                    }
                    .font(.system(size: levelTextSize))
                    Spacer()
                }
            }
            .foregroundColor(.black)
            
            Spacer()
        }
    }
}

struct LevelSelectView_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectView(navigationPath: .constant(NavigationPath()), selectedLevel: .constant(1), isDoubleText: .constant(false))
    }
}
