//
//  LevelSelectView.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/07/09.
//

import SwiftUI

struct LevelSelectView: View {
    @Binding var navigationPath: NavigationPath
    @Binding var selectedLevel: Int
    @Binding var isDoubleText: Bool
    let titleTextSize: CGFloat = 40
    let levelTextSize: CGFloat = 30
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                Group {
                    Text("ひらがな")
                        .font(.system(size: titleTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 1
                        isDoubleText = false
                        navigationPath.append(1)
                    } label: {
                        Text("Level 1")
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
                        Text("Level 2")
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
                        Text("Level 3")
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
                        Text("Level 4")
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
                        .font(.system(size: titleTextSize))
                    Spacer()
                }
                
                Group {
                    Button {
                        selectedLevel = 5
                        isDoubleText = false
                        navigationPath.append(5)
                    } label: {
                        Text("Level 1")
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
                        Text("Level 2")
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
                        Text("Level 3")
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
                        Text("Level 4")
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
