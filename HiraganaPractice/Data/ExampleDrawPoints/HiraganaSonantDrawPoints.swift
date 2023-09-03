//
//  HiraganaSonantDrawPoints.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/09/01.
//

import SwiftUI

class HiraganaSonantDrawPoints: ObservableObject {
    
    let ga1: [CGPoint] = [
        CGPoint(x: 58 - 2, y: 127),
        CGPoint(x: 70 - 2, y: 125),
        CGPoint(x: 82 - 2, y: 123),
        CGPoint(x: 94 - 2, y: 122),
        CGPoint(x: 106 - 2, y: 121),
        CGPoint(x: 118 - 2, y: 120),
        CGPoint(x: 130 - 2, y: 120),
        CGPoint(x: 138 - 2, y: 121),
        CGPoint(x: 143 - 2, y: 123),
        CGPoint(x: 148 - 2, y: 127),
        CGPoint(x: 153 - 2, y: 138),
        CGPoint(x: 154 - 2, y: 150),
        CGPoint(x: 153 - 2, y: 162),
        CGPoint(x: 152 - 2, y: 174),
        CGPoint(x: 149 - 2, y: 186),
        CGPoint(x: 145 - 2, y: 198),
        CGPoint(x: 141 - 2, y: 210),
        CGPoint(x: 135 - 2, y: 222),
        CGPoint(x: 128 - 2, y: 234),
        CGPoint(x: 123 - 2, y: 239),
        CGPoint(x: 111 - 2, y: 232),
        CGPoint(x: 99 - 2, y: 223),
    ]
    
    let ga2: [CGPoint] = [
        CGPoint(x: 125 - 2, y: 65),
        CGPoint(x: 121 - 2, y: 77),
        CGPoint(x: 116 - 2, y: 89),
        CGPoint(x: 112 - 2, y: 101),
        CGPoint(x: 107 - 2, y: 113),
        CGPoint(x: 102 - 2, y: 125),
        CGPoint(x: 98 - 2, y: 137),
        CGPoint(x: 93 - 2, y: 149),
        CGPoint(x: 88 - 2, y: 161),
        CGPoint(x: 82 - 2, y: 173),
        CGPoint(x: 76 - 2, y: 185),
        CGPoint(x: 70 - 2, y: 197),
        CGPoint(x: 64 - 2, y: 209),
        CGPoint(x: 62 - 2, y: 212),
    ]
    
    let ga3: [CGPoint] = [
        CGPoint(x: 208 - 8, y: 107),
        CGPoint(x: 218 - 8, y: 119),
        CGPoint(x: 227 - 8, y: 131),
        CGPoint(x: 236 - 8, y: 143),
        CGPoint(x: 243 - 8, y: 155),
        CGPoint(x: 246 - 8, y: 160),
    ]
    
    let ga4: [CGPoint] = [
        CGPoint(x: 223, y: 80),
        CGPoint(x: 232, y: 90),
        CGPoint(x: 240, y: 100),
        CGPoint(x: 243, y: 104),
    ]
    
    let ga5: [CGPoint] = [
        CGPoint(x: 244, y: 65),
        CGPoint(x: 255, y: 75),
        CGPoint(x: 264, y: 86),
    ]
    
    let gi1: [CGPoint] = [
        CGPoint(x: 87 - 5, y: 100),
        CGPoint(x: 99 - 5, y: 98),
        CGPoint(x: 111 - 5, y: 96),
        CGPoint(x: 123 - 5, y: 94),
        CGPoint(x: 135 - 5, y: 92),
        CGPoint(x: 147 - 5, y: 90),
        CGPoint(x: 159 - 5, y: 88),
        CGPoint(x: 171 - 5, y: 86),
        CGPoint(x: 183 - 5, y: 84),
        CGPoint(x: 193 - 5, y: 82),
    ]
    
    let gi2: [CGPoint] = [
        CGPoint(x: 104 - 5, y: 146),
        CGPoint(x: 116 - 5, y: 144),
        CGPoint(x: 128 - 5, y: 142),
        CGPoint(x: 140 - 5, y: 140),
        CGPoint(x: 152 - 5, y: 138),
        CGPoint(x: 164 - 5, y: 136),
        CGPoint(x: 176 - 5, y: 133),
        CGPoint(x: 188 - 5, y: 131),
        CGPoint(x: 200 - 5, y: 128),
        CGPoint(x: 212 - 5, y: 126),
    ]
    
    let gi3: [CGPoint] = [
        CGPoint(x: 131 - 5, y: 52),
        CGPoint(x: 136 - 5, y: 64),
        CGPoint(x: 141 - 5, y: 76),
        CGPoint(x: 146 - 5, y: 88),
        CGPoint(x: 152 - 5, y: 100),
        CGPoint(x: 159 - 5, y: 112),
        CGPoint(x: 165 - 5, y: 124),
        CGPoint(x: 171 - 5, y: 136),
        CGPoint(x: 178 - 5, y: 148),
        CGPoint(x: 185 - 5, y: 160),
        CGPoint(x: 193 - 5, y: 172),
        CGPoint(x: 197 - 5, y: 178),
        CGPoint(x: 185 - 5, y: 177),
        CGPoint(x: 173 - 5, y: 176),
        CGPoint(x: 165 - 5, y: 175),
    ]
    
    let gi4: [CGPoint] = [
        CGPoint(x: 102 - 5, y: 208),
        CGPoint(x: 110 - 5, y: 220),
        CGPoint(x: 120 - 5, y: 229),
        CGPoint(x: 132 - 5, y: 234),
        CGPoint(x: 144 - 5, y: 237),
        CGPoint(x: 156 - 5, y: 240),
        CGPoint(x: 168 - 5, y: 241),
        CGPoint(x: 180 - 5, y: 241),
    ]
    
    let gi5: [CGPoint] = [
        CGPoint(x: 223 - 10, y: 80 - 12),
        CGPoint(x: 232 - 10, y: 90 - 12),
        CGPoint(x: 240 - 10, y: 100 - 12),
        CGPoint(x: 243 - 10, y: 104 - 12),
    ]
    
    let gi6: [CGPoint] = [
        CGPoint(x: 244 - 10, y: 65 - 12),
        CGPoint(x: 255 - 10, y: 75 - 12),
        CGPoint(x: 264 - 10, y: 86 - 12),
    ]
    
    let gu1: [CGPoint] = [
        CGPoint(x: 182, y: 58),
        CGPoint(x: 172, y: 70),
        CGPoint(x: 162, y: 82),
        CGPoint(x: 151, y: 94),
        CGPoint(x: 140, y: 106),
        CGPoint(x: 128, y: 118),
        CGPoint(x: 114, y: 130),
        CGPoint(x: 100, y: 142),
        CGPoint(x: 93, y: 149),
        CGPoint(x: 93, y: 151),
        CGPoint(x: 105, y: 162),
        CGPoint(x: 117, y: 172),
        CGPoint(x: 129, y: 182),
        CGPoint(x: 141, y: 193),
        CGPoint(x: 153, y: 203),
        CGPoint(x: 165, y: 215),
        CGPoint(x: 175, y: 227),
        CGPoint(x: 180, y: 234),
        CGPoint(x: 187, y: 243),
    ]
    
    let gu2: [CGPoint] = [
        CGPoint(x: 223 - 8, y: 80 - 1),
        CGPoint(x: 232 - 8, y: 90 - 1),
        CGPoint(x: 240 - 8, y: 100 - 1),
        CGPoint(x: 243 - 8, y: 104 - 1),
    ]
    
    let gu3: [CGPoint] = [
        CGPoint(x: 244 - 8, y: 65 - 1),
        CGPoint(x: 255 - 8, y: 75 - 1),
        CGPoint(x: 264 - 8, y: 86 - 1),
    ]
    
    let ge1: [CGPoint] = [
        CGPoint(x: 82 - 2, y: 74),
        CGPoint(x: 80 - 2, y: 86),
        CGPoint(x: 79 - 2, y: 98),
        CGPoint(x: 78 - 2, y: 110),
        CGPoint(x: 77 - 2, y: 122),
        CGPoint(x: 76 - 2, y: 134),
        CGPoint(x: 75 - 2, y: 146),
        CGPoint(x: 74 - 2, y: 158),
        CGPoint(x: 74 - 2, y: 170),
        CGPoint(x: 74 - 2, y: 182),
        CGPoint(x: 75 - 2, y: 194),
        CGPoint(x: 76 - 2, y: 206),
        CGPoint(x: 78 - 2, y: 216),
        CGPoint(x: 81 - 2, y: 225),
        CGPoint(x: 86 - 2, y: 213),
        CGPoint(x: 91 - 2, y: 201),
        CGPoint(x: 96 - 2, y: 189),
        CGPoint(x: 101 - 2, y: 177),
    ]
    
    let ge2: [CGPoint] = [
        CGPoint(x: 138 - 2, y: 122),
        CGPoint(x: 150 - 2, y: 121),
        CGPoint(x: 162 - 2, y: 120),
        CGPoint(x: 174 - 2, y: 118),
        CGPoint(x: 186 - 2, y: 117),
        CGPoint(x: 198 - 2, y: 116),
        CGPoint(x: 210 - 2, y: 114),
        CGPoint(x: 222 - 2, y: 113),
        CGPoint(x: 234 - 2, y: 112),
        CGPoint(x: 238 - 2, y: 111),
    ]
    
    let ge3: [CGPoint] = [
        CGPoint(x: 196 - 2, y: 63),
        CGPoint(x: 197 - 2, y: 75),
        CGPoint(x: 198 - 2, y: 87),
        CGPoint(x: 199 - 2, y: 99),
        CGPoint(x: 199 - 2, y: 111),
        CGPoint(x: 199 - 2, y: 123),
        CGPoint(x: 199 - 2, y: 135),
        CGPoint(x: 200 - 2, y: 147),
        CGPoint(x: 200 - 2, y: 159),
        CGPoint(x: 200 - 2, y: 171),
        CGPoint(x: 199 - 2, y: 183),
        CGPoint(x: 198 - 2, y: 195),
        CGPoint(x: 196 - 2, y: 204),
        CGPoint(x: 193 - 2, y: 212),
        CGPoint(x: 188 - 2, y: 220),
        CGPoint(x: 184 - 2, y: 227),
        CGPoint(x: 179 - 2, y: 234),
        CGPoint(x: 173 - 2, y: 240),
        CGPoint(x: 166 - 2, y: 245),
    ]
    
    let ge4: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 22),
        CGPoint(x: 232, y: 90 - 22),
        CGPoint(x: 240, y: 100 - 22),
        CGPoint(x: 243, y: 104 - 22),
    ]
    
    let ge5: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 22),
        CGPoint(x: 255, y: 75 - 22),
        CGPoint(x: 264, y: 86 - 22),
    ]
    
    let go1: [CGPoint] = [
        CGPoint(x: 97 - 3, y: 83 + 2),
        CGPoint(x: 109 - 3, y: 82 + 2),
        CGPoint(x: 121 - 3, y: 81 + 2),
        CGPoint(x: 133 - 3, y: 81 + 2),
        CGPoint(x: 145 - 3, y: 81.5 + 2),
        CGPoint(x: 157 - 3, y: 83 + 2),
        CGPoint(x: 169 - 3, y: 85 + 2),
        CGPoint(x: 181 - 3, y: 88 + 2),
        CGPoint(x: 190 - 3, y: 92 + 2),
        CGPoint(x: 195 - 3, y: 96 + 2),
        CGPoint(x: 183 - 3, y: 104 + 2),
        CGPoint(x: 171 - 3, y: 112 + 2),
        CGPoint(x: 164 - 3, y: 116 + 2),
    ]
    
    let go2: [CGPoint] = [
        CGPoint(x: 90 - 3, y: 190 + 2),
        CGPoint(x: 99 - 3, y: 202 + 2),
        CGPoint(x: 111 - 3, y: 212 + 2),
        CGPoint(x: 123 - 3, y: 216 + 2),
        CGPoint(x: 135 - 3, y: 220 + 2),
        CGPoint(x: 147 - 3, y: 222 + 2),
        CGPoint(x: 159 - 3, y: 223 + 2),
        CGPoint(x: 171 - 3, y: 223 + 2),
        CGPoint(x: 183 - 3, y: 222 + 2),
        CGPoint(x: 195 - 3, y: 221 + 2),
        CGPoint(x: 207 - 3, y: 220 + 2),
    ]
    
    let go3: [CGPoint] = [
        CGPoint(x: 223 - 5 , y: 80 - 5),
        CGPoint(x: 232 - 5, y: 90 - 5),
        CGPoint(x: 240 - 5, y: 100 - 5),
        CGPoint(x: 243 - 5, y: 104 - 5),
    ]
    
    let go4: [CGPoint] = [
        CGPoint(x: 244 - 5, y: 65 - 5),
        CGPoint(x: 255 - 5, y: 75 - 5),
        CGPoint(x: 264 - 5, y: 86 - 5),
    ]
    
    let za1: [CGPoint] = [
        CGPoint(x: 71 - 2, y: 122),
        CGPoint(x: 83 - 2, y: 121),
        CGPoint(x: 95 - 2, y: 119),
        CGPoint(x: 107 - 2, y: 117),
        CGPoint(x: 119 - 2, y: 115),
        CGPoint(x: 131 - 2, y: 112),
        CGPoint(x: 143 - 2, y: 109),
        CGPoint(x: 155 - 2, y: 106),
        CGPoint(x: 167 - 2, y: 103),
        CGPoint(x: 179 - 2, y: 100),
        CGPoint(x: 191 - 2, y: 97),
        CGPoint(x: 203 - 2, y: 94),
        CGPoint(x: 215 - 2, y: 91),
        CGPoint(x: 219 - 2, y: 90),
    ]
    
    let za2: [CGPoint] = [
        CGPoint(x: 134 - 2, y: 58),
        CGPoint(x: 140 - 2, y: 70),
        CGPoint(x: 147 - 2, y: 82),
        CGPoint(x: 154 - 2, y: 94),
        CGPoint(x: 161 - 2, y: 106),
        CGPoint(x: 168 - 2, y: 118),
        CGPoint(x: 176 - 2, y: 130),
        CGPoint(x: 184 - 2, y: 142),
        CGPoint(x: 193 - 2, y: 154),
        CGPoint(x: 202 - 2, y: 166),
        CGPoint(x: 190 - 2, y: 165),
        CGPoint(x: 178 - 2, y: 163),
        CGPoint(x: 166 - 2, y: 161),
    ]
    
    let za3: [CGPoint] = [
        CGPoint(x: 105 - 2, y: 194),
        CGPoint(x: 108 - 2, y: 206),
        CGPoint(x: 115 - 2, y: 218),
        CGPoint(x: 127 - 2, y: 227),
        CGPoint(x: 139 - 2, y: 232),
        CGPoint(x: 151 - 2, y: 235),
        CGPoint(x: 163 - 2, y: 237),
        CGPoint(x: 175 - 2, y: 237.5),
        CGPoint(x: 180 - 2, y: 237.5),
    ]
    
    let za4: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 12),
        CGPoint(x: 232, y: 90 - 12),
        CGPoint(x: 240, y: 100 - 12),
        CGPoint(x: 243, y: 104 - 12),
    ]
    
    let za5: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 12),
        CGPoint(x: 255, y: 75 - 12),
        CGPoint(x: 264, y: 86 - 12),
    ]
    
    let zi1: [CGPoint] = [
        CGPoint(x: 110, y: 64),
        CGPoint(x: 110, y: 76),
        CGPoint(x: 109.5, y: 88),
        CGPoint(x: 109, y: 100),
        CGPoint(x: 108.5, y: 112),
        CGPoint(x: 107.5, y: 124),
        CGPoint(x: 107, y: 136),
        CGPoint(x: 106, y: 148),
        CGPoint(x: 105.5, y: 160),
        CGPoint(x: 105, y: 172),
        CGPoint(x: 105, y: 184),
        CGPoint(x: 106, y: 196),
        CGPoint(x: 108, y: 206),
        CGPoint(x: 112, y: 216),
        CGPoint(x: 119, y: 224),
        CGPoint(x: 128, y: 230),
        CGPoint(x: 140, y: 234),
        CGPoint(x: 152, y: 235),
        CGPoint(x: 160, y: 235),
        CGPoint(x: 168, y: 233),
        CGPoint(x: 177, y: 230),
        CGPoint(x: 185, y: 226),
        CGPoint(x: 197, y: 217),
        CGPoint(x: 208, y: 206),
        CGPoint(x: 217, y: 194),
        CGPoint(x: 222, y: 187),
    ]
    
    let zi2: [CGPoint] = [
        CGPoint(x: 223 - 52, y: 80 + 11),
        CGPoint(x: 232 - 52, y: 90 + 11),
        CGPoint(x: 240 - 52, y: 100 + 11),
        CGPoint(x: 243 - 52, y: 104 + 11),
    ]
    
    let zi3: [CGPoint] = [
        CGPoint(x: 244 - 52, y: 65 + 11),
        CGPoint(x: 255 - 52, y: 75 + 11),
        CGPoint(x: 264 - 52, y: 86 + 11),
    ]
    
    let zu1: [CGPoint] = [
        CGPoint(x: 58 - 2, y: 106 + 1),
        CGPoint(x: 70 - 2, y: 105 + 1),
        CGPoint(x: 82 - 2, y: 104 + 1),
        CGPoint(x: 94 - 2, y: 102.5 + 1),
        CGPoint(x: 106 - 2, y: 101 + 1),
        CGPoint(x: 118 - 2, y: 99.5 + 1),
        CGPoint(x: 130 - 2, y: 98 + 1),
        CGPoint(x: 142 - 2, y: 97 + 1),
        CGPoint(x: 154 - 2, y: 96 + 1),
        CGPoint(x: 166 - 2, y: 95 + 1),
        CGPoint(x: 178 - 2, y: 94 + 1),
        CGPoint(x: 190 - 2, y: 93 + 1),
        CGPoint(x: 202 - 2, y: 92 + 1),
        CGPoint(x: 214 - 2, y: 91 + 1),
        CGPoint(x: 226 - 2, y: 90 + 1),
        CGPoint(x: 236 - 2, y: 90 + 1),
    ]
    
    let zu2: [CGPoint] = [
        CGPoint(x: 164.5 - 2, y: 53 + 1),
        CGPoint(x: 165 - 2, y: 65 + 1),
        CGPoint(x: 166 - 2, y: 77 + 1),
        CGPoint(x: 166 - 2, y: 89 + 1),
        CGPoint(x: 166 - 2, y: 101 + 1),
        CGPoint(x: 166.5 - 2, y: 113 + 1),
        CGPoint(x: 167 - 2, y: 125 + 1),
        CGPoint(x: 167 - 2, y: 137 + 1),
        CGPoint(x: 167 - 2, y: 149 + 1),
        CGPoint(x: 167 - 2, y: 161 + 1),
        CGPoint(x: 166 - 2, y: 173 + 1),
        CGPoint(x: 163 - 2, y: 182 + 1),
        CGPoint(x: 156 - 2, y: 189 + 1),
        CGPoint(x: 148 - 2, y: 194 + 1),
        CGPoint(x: 143 - 2, y: 194 + 1),
        CGPoint(x: 138 - 2, y: 193 + 1),
        CGPoint(x: 130 - 2, y: 188 + 1),
        CGPoint(x: 122 - 2, y: 180 + 1),
        CGPoint(x: 116 - 2, y: 170 + 1),
        CGPoint(x: 113 - 2, y: 160 + 1),
        CGPoint(x: 118 - 2, y: 148 + 1),
        CGPoint(x: 125 - 2, y: 139 + 1),
        CGPoint(x: 132 - 2, y: 134 + 1),
        CGPoint(x: 138 - 2, y: 132 + 1),
        CGPoint(x: 150 - 2, y: 135 + 1),
        CGPoint(x: 158 - 2, y: 147 + 1),
        CGPoint(x: 160 - 2, y: 159 + 1),
        CGPoint(x: 160 - 2, y: 159 + 1),
        CGPoint(x: 162 - 2, y: 171 + 1),
        CGPoint(x: 161 - 2, y: 183 + 1),
        CGPoint(x: 161 - 2, y: 195 + 1),
        CGPoint(x: 159 - 2, y: 207 + 1),
        CGPoint(x: 154 - 2, y: 219 + 1),
        CGPoint(x: 147 - 2, y: 231 + 1),
        CGPoint(x: 138 - 2, y: 241 + 1),
        CGPoint(x: 132 - 2, y: 247 + 1),
    ]
    
    let zu3: [CGPoint] = [
        CGPoint(x: 223 - 10, y: 80 - 36),
        CGPoint(x: 232 - 10, y: 90 - 36),
        CGPoint(x: 240 - 10, y: 100 - 36),
        CGPoint(x: 243 - 10, y: 104 - 36),
    ]
    
    let zu4: [CGPoint] = [
        CGPoint(x: 244 - 3, y: 65 - 27),
        CGPoint(x: 255 - 3, y: 75 - 27),
        CGPoint(x: 264 - 3, y: 86 - 27),
    ]
    
    let ze1: [CGPoint] = [
        CGPoint(x: 49 - 4, y: 140 + 4),
        CGPoint(x: 61 - 4, y: 138 + 4),
        CGPoint(x: 73 - 4, y: 135.5 + 4),
        CGPoint(x: 85 - 4, y: 133 + 4),
        CGPoint(x: 97 - 4, y: 130.5 + 4),
        CGPoint(x: 109 - 4, y: 128 + 4),
        CGPoint(x: 121 - 4, y: 125.5 + 4),
        CGPoint(x: 133 - 4, y: 123 + 4),
        CGPoint(x: 145 - 4, y: 120.5 + 4),
        CGPoint(x: 157 - 4, y: 118 + 4),
        CGPoint(x: 169 - 4, y: 116 + 4),
        CGPoint(x: 181 - 4, y: 113.5 + 4),
        CGPoint(x: 193 - 4, y: 111 + 4),
        CGPoint(x: 205 - 4, y: 109 + 4),
        CGPoint(x: 217 - 4, y: 107.5 + 4),
        CGPoint(x: 229 - 4, y: 106 + 4),
        CGPoint(x: 241 - 4, y: 104 + 4),
        CGPoint(x: 253 - 4, y: 102 + 4),
    ]
    
    let ze2: [CGPoint] = [
        CGPoint(x: 198 - 2, y: 55 + 3),
        CGPoint(x: 198 - 2, y: 67 + 3),
        CGPoint(x: 198 - 2, y: 79 + 3),
        CGPoint(x: 198 - 2, y: 91 + 3),
        CGPoint(x: 197.5 - 2, y: 103 + 3),
        CGPoint(x: 197 - 2, y: 115 + 3),
        CGPoint(x: 196 - 2, y: 127 + 3),
        CGPoint(x: 195 - 2, y: 139 + 3),
        CGPoint(x: 194 - 2, y: 151 + 3),
        CGPoint(x: 192 - 2, y: 163 + 3),
        CGPoint(x: 189 - 2, y: 175 + 3),
        CGPoint(x: 186 - 2, y: 178 + 3),
        CGPoint(x: 174 - 2, y: 166 + 3),
        CGPoint(x: 162 - 2, y: 154 + 3),
    ]
    
    let ze3: [CGPoint] = [
        CGPoint(x: 103 - 2, y: 78 + 3),
        CGPoint(x: 104 - 2, y: 90 + 3),
        CGPoint(x: 105 - 2, y: 102 + 3),
        CGPoint(x: 105.5 - 2, y: 114 + 3),
        CGPoint(x: 106 - 2, y: 126 + 3),
        CGPoint(x: 106.5 - 2, y: 138 + 3),
        CGPoint(x: 107 - 2, y: 150 + 3),
        CGPoint(x: 108 - 2, y: 162 + 3),
        CGPoint(x: 108.5 - 2, y: 174 + 3),
        CGPoint(x: 109 - 2, y: 186 + 3),
        CGPoint(x: 110 - 2, y: 198 + 3),
        CGPoint(x: 114 - 2, y: 208 + 3),
        CGPoint(x: 126 - 2, y: 216 + 3),
        CGPoint(x: 138 - 2, y: 219 + 3),
        CGPoint(x: 150 - 2, y: 221 + 3),
        CGPoint(x: 162 - 2, y: 222 + 3),
        CGPoint(x: 174 - 2, y: 222 + 3),
        CGPoint(x: 186 - 2, y: 222 + 3),
        CGPoint(x: 198 - 2, y: 221 + 3),
        CGPoint(x: 212 - 2, y: 220 + 3),
    ]
    
    let ze4: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 25),
        CGPoint(x: 232, y: 90 - 25),
        CGPoint(x: 240, y: 100 - 25),
        CGPoint(x: 243, y: 104 - 25),
    ]
    
    let ze5: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 25),
        CGPoint(x: 255, y: 75 - 25),
        CGPoint(x: 264, y: 86 - 25),
    ]
    
    let zo1: [CGPoint] = [
        CGPoint(x: 104, y: 73),
        CGPoint(x: 116, y: 72),
        CGPoint(x: 128, y: 71),
        CGPoint(x: 140, y: 69),
        CGPoint(x: 152, y: 67),
        CGPoint(x: 164, y: 65),
        CGPoint(x: 176, y: 63),
        CGPoint(x: 188, y: 63),
        CGPoint(x: 191, y: 69),
        CGPoint(x: 179, y: 79),
        CGPoint(x: 167, y: 89),
        CGPoint(x: 155, y: 98),
        CGPoint(x: 143, y: 106),
        CGPoint(x: 131, y: 114),
        CGPoint(x: 119, y: 121),
        CGPoint(x: 107, y: 129),
        CGPoint(x: 95, y: 135),
        CGPoint(x: 83, y: 142),
        CGPoint(x: 71, y: 148),
        CGPoint(x: 66, y: 152),
        CGPoint(x: 78, y: 150),
        CGPoint(x: 90, y: 149),
        CGPoint(x: 102, y: 147),
        CGPoint(x: 114, y: 145),
        CGPoint(x: 126, y: 143),
        CGPoint(x: 138, y: 141),
        CGPoint(x: 150, y: 139),
        CGPoint(x: 162, y: 137),
        CGPoint(x: 174, y: 135),
        CGPoint(x: 186, y: 133),
        CGPoint(x: 198, y: 131),
        CGPoint(x: 210, y: 129),
        CGPoint(x: 222, y: 127),
        CGPoint(x: 234, y: 125),
        CGPoint(x: 234, y: 127),
        CGPoint(x: 222, y: 130),
        CGPoint(x: 210, y: 133),
        CGPoint(x: 198, y: 138),
        CGPoint(x: 186, y: 144),
        CGPoint(x: 176, y: 150),
        CGPoint(x: 166, y: 158),
        CGPoint(x: 154, y: 170),
        CGPoint(x: 147, y: 182),
        CGPoint(x: 144, y: 194),
        CGPoint(x: 145, y: 201),
        CGPoint(x: 147, y: 208),
        CGPoint(x: 150, y: 214),
        CGPoint(x: 157, y: 224),
        CGPoint(x: 169, y: 233),
        CGPoint(x: 181, y: 239),
        CGPoint(x: 196, y: 244),
    ]
    
    let zo2: [CGPoint] = [
        CGPoint(x: 223 - 8, y: 80 - 20),
        CGPoint(x: 232 - 8, y: 90 - 20),
        CGPoint(x: 240 - 8, y: 100 - 20),
        CGPoint(x: 243 - 8, y: 104 - 20),
    ]
    
    let zo3: [CGPoint] = [
        CGPoint(x: 244 - 8, y: 65 - 20),
        CGPoint(x: 255 - 8, y: 75 - 20),
        CGPoint(x: 264 - 8, y: 86 - 20),
    ]
    
    let da1: [CGPoint] = [
        CGPoint(x: 70, y: 108),
        CGPoint(x: 82, y: 107),
        CGPoint(x: 94, y: 106),
        CGPoint(x: 106, y: 105),
        CGPoint(x: 118, y: 103.5),
        CGPoint(x: 130, y: 102),
        CGPoint(x: 142, y: 100),
        CGPoint(x: 154, y: 98),
        CGPoint(x: 166, y: 96),
    ]
    
    let da2: [CGPoint] = [
        CGPoint(x: 127, y: 60),
        CGPoint(x: 124, y: 72),
        CGPoint(x: 120.5, y: 84),
        CGPoint(x: 117, y: 96),
        CGPoint(x: 113.5, y: 108),
        CGPoint(x: 110, y: 120),
        CGPoint(x: 106, y: 132),
        CGPoint(x: 102, y: 144),
        CGPoint(x: 98, y: 156),
        CGPoint(x: 93, y: 168),
        CGPoint(x: 88, y: 180),
        CGPoint(x: 83.5, y: 192),
        CGPoint(x: 79, y: 204),
        CGPoint(x: 74, y: 216),
        CGPoint(x: 69, y: 228),
        CGPoint(x: 67, y: 232),
    ]
    
    let da3: [CGPoint] = [
        CGPoint(x: 155, y: 152),
        CGPoint(x: 167, y: 149),
        CGPoint(x: 179, y: 146.5),
        CGPoint(x: 191, y: 144),
        CGPoint(x: 203, y: 143),
        CGPoint(x: 215, y: 144),
        CGPoint(x: 224, y: 146),
    ]
    
    let da4: [CGPoint] = [
        CGPoint(x: 155, y: 210),
        CGPoint(x: 167, y: 221),
        CGPoint(x: 179, y: 227),
        CGPoint(x: 191, y: 231),
        CGPoint(x: 203, y: 233),
        CGPoint(x: 215, y: 234),
        CGPoint(x: 225, y: 234),
    ]
    
    let da5: [CGPoint] = [
        CGPoint(x: 223 - 12, y: 80 - 16),
        CGPoint(x: 232 - 12, y: 90 - 16),
        CGPoint(x: 240 - 12, y: 100 - 16),
        CGPoint(x: 243 - 12, y: 104 - 16),
    ]
    
    let da6: [CGPoint] = [
        CGPoint(x: 244 - 12, y: 65 - 16),
        CGPoint(x: 255 - 12, y: 75 - 16),
        CGPoint(x: 264 - 12, y: 86 - 16),
    ]
    
    let di1: [CGPoint] = [
        CGPoint(x: 74 - 2, y: 105),
        CGPoint(x: 86 - 2, y: 104),
        CGPoint(x: 98 - 2, y: 103),
        CGPoint(x: 110 - 2, y: 102),
        CGPoint(x: 122 - 2, y: 101),
        CGPoint(x: 134 - 2, y: 100),
        CGPoint(x: 146 - 2, y: 98.5),
        CGPoint(x: 158 - 2, y: 97),
        CGPoint(x: 170 - 2, y: 95),
        CGPoint(x: 182 - 2, y: 93),
        CGPoint(x: 191 - 2, y: 91),
    ]
    
    let di2: [CGPoint] = [
        CGPoint(x: 136 - 2, y: 56),
        CGPoint(x: 133 - 2, y: 68),
        CGPoint(x: 130 - 2, y: 80),
        CGPoint(x: 127.5 - 2, y: 92),
        CGPoint(x: 125 - 2, y: 104),
        CGPoint(x: 122.5 - 2, y: 116),
        CGPoint(x: 120 - 2, y: 128),
        CGPoint(x: 117.5 - 2, y: 140),
        CGPoint(x: 115 - 2, y: 152),
        CGPoint(x: 112.5 - 2, y: 164),
        CGPoint(x: 110 - 2, y: 176),
        CGPoint(x: 108 - 2, y: 188),
        CGPoint(x: 120 - 2, y: 182),
        CGPoint(x: 132 - 2, y: 175),
        CGPoint(x: 144 - 2, y: 169),
        CGPoint(x: 156 - 2, y: 165),
        CGPoint(x: 168 - 2, y: 162),
        CGPoint(x: 180 - 2, y: 161),
        CGPoint(x: 192 - 2, y: 162),
        CGPoint(x: 204 - 2, y: 165),
        CGPoint(x: 216 - 2, y: 175),
        CGPoint(x: 220 - 2, y: 183),
        CGPoint(x: 221 - 2, y: 190),
        CGPoint(x: 220 - 2, y: 198),
        CGPoint(x: 217 - 2, y: 207),
        CGPoint(x: 208 - 2, y: 219),
        CGPoint(x: 196 - 2, y: 228),
        CGPoint(x: 184 - 2, y: 234),
        CGPoint(x: 172 - 2, y: 238),
        CGPoint(x: 160 - 2, y: 241),
        CGPoint(x: 154 - 2, y: 242),
    ]
    
    let di3: [CGPoint] = [
        CGPoint(x: 223 - 6, y: 80 - 14),
        CGPoint(x: 232 - 6, y: 90 - 14),
        CGPoint(x: 240 - 6, y: 100 - 14),
        CGPoint(x: 243 - 6, y: 104 - 14),
    ]
    
    let di4: [CGPoint] = [
        CGPoint(x: 244 - 6, y: 65 - 16),
        CGPoint(x: 255 - 6, y: 75 - 16),
        CGPoint(x: 264 - 6, y: 86 - 16),
    ]
    
    let du1: [CGPoint] = [
        CGPoint(x: 60 - 2, y: 122 + 2),
        CGPoint(x: 72 - 2, y: 120 + 2),
        CGPoint(x: 84 - 2, y: 118 + 2),
        CGPoint(x: 96 - 2, y: 116 + 2),
        CGPoint(x: 108 - 2, y: 114 + 2),
        CGPoint(x: 120 - 2, y: 112 + 2),
        CGPoint(x: 132 - 2, y: 110 + 2),
        CGPoint(x: 144 - 2, y: 108 + 2),
        CGPoint(x: 156 - 2, y: 106 + 2),
        CGPoint(x: 168 - 2, y: 104 + 2),
        CGPoint(x: 180 - 2, y: 102 + 2),
        CGPoint(x: 192 - 2, y: 102 + 2),
        CGPoint(x: 202 - 2, y: 103 + 2),
        CGPoint(x: 210 - 2, y: 106 + 2),
        CGPoint(x: 217 - 2, y: 110 + 2),
        CGPoint(x: 225 - 2, y: 116 + 2),
        CGPoint(x: 233 - 2, y: 128 + 2),
        CGPoint(x: 236 - 2, y: 138 + 2),
        CGPoint(x: 236 - 2, y: 150 + 2),
        CGPoint(x: 235 - 2, y: 160 + 2),
        CGPoint(x: 232 - 2, y: 170 + 2),
        CGPoint(x: 227 - 2, y: 178 + 2),
        CGPoint(x: 221 - 2, y: 186 + 2),
        CGPoint(x: 209 - 2, y: 196 + 2),
        CGPoint(x: 197 - 2, y: 204 + 2),
        CGPoint(x: 185 - 2, y: 210 + 2),
        CGPoint(x: 173 - 2, y: 215 + 2),
        CGPoint(x: 162 - 2, y: 218 + 2),
    ]
    
    let du2: [CGPoint] = [
        CGPoint(x: 223 - 13, y: 80 - 22),
        CGPoint(x: 232 - 13, y: 90 - 22),
        CGPoint(x: 240 - 13, y: 100 - 22),
        CGPoint(x: 243 - 13, y: 104 - 22),
    ]
    
    let du3: [CGPoint] = [
        CGPoint(x: 244 - 5, y: 65 - 15),
        CGPoint(x: 255 - 5, y: 75 - 15),
        CGPoint(x: 264 - 5, y: 86 - 15),
    ]
    
    let de1: [CGPoint] = [
        CGPoint(x: 63 - 8, y: 100 + 5),
        CGPoint(x: 75 - 8, y: 98 + 5),
        CGPoint(x: 87 - 8, y: 96 + 5),
        CGPoint(x: 99 - 8, y: 94 + 5),
        CGPoint(x: 111 - 8, y: 92.5 + 5),
        CGPoint(x: 123 - 8, y: 91 + 5),
        CGPoint(x: 135 - 8, y: 89 + 5),
        CGPoint(x: 147 - 8, y: 87.5 + 5),
        CGPoint(x: 159 - 8, y: 85.5 + 5),
        CGPoint(x: 171 - 8, y: 83 + 5),
        CGPoint(x: 183 - 8, y: 81 + 5),
        CGPoint(x: 195 - 8, y: 79 + 5),
        CGPoint(x: 207 - 8, y: 77 + 5),
        CGPoint(x: 219 - 8, y: 75 + 5),
        CGPoint(x: 225 - 8, y: 74 + 5),
        CGPoint(x: 226 - 8, y: 77 + 5),
        CGPoint(x: 214 - 8, y: 81 + 5),
        CGPoint(x: 202 - 8, y: 87 + 5),
        CGPoint(x: 190 - 8, y: 95 + 5),
        CGPoint(x: 180 - 8, y: 103 + 5),
        CGPoint(x: 170 - 8, y: 112 + 5),
        CGPoint(x: 162 - 8, y: 122 + 5),
        CGPoint(x: 154 - 8, y: 134 + 5),
        CGPoint(x: 149 - 8, y: 146 + 5),
        CGPoint(x: 145 - 8, y: 158 + 5),
        CGPoint(x: 144 - 8, y: 170 + 5),
        CGPoint(x: 146 - 8, y: 182 + 5),
        CGPoint(x: 150 - 8, y: 194 + 5),
        CGPoint(x: 157 - 8, y: 206 + 5),
        CGPoint(x: 169 - 8, y: 217 + 5),
        CGPoint(x: 181 - 8, y: 225 + 5),
        CGPoint(x: 190 - 8, y: 229 + 5),
        CGPoint(x: 197 - 8, y: 232 + 5),
    ]
    
    let de2: [CGPoint] = [
        CGPoint(x: 223 + 1, y: 80 - 20),
        CGPoint(x: 232 + 1, y: 90 - 20),
        CGPoint(x: 240 + 1, y: 100 - 20),
        CGPoint(x: 243 + 1, y: 104 - 20),
    ]
    
    let de3: [CGPoint] = [
        CGPoint(x: 244 + 1, y: 65 - 20),
        CGPoint(x: 255 + 1, y: 75 - 20),
        CGPoint(x: 264 + 1, y: 86 - 20),
    ]
    
    let do1: [CGPoint] = [
        CGPoint(x: 101 - 5, y: 67),
        CGPoint(x: 106 - 5, y: 79),
        CGPoint(x: 110 - 5, y: 91),
        CGPoint(x: 113.5 - 5, y: 103),
        CGPoint(x: 117.5 - 5, y: 115),
        CGPoint(x: 121 - 5, y: 127),
        CGPoint(x: 126 - 5, y: 139),
        CGPoint(x: 130 - 5, y: 148),
    ]
    
    let do2: [CGPoint] = [
        CGPoint(x: 210 - 5, y: 97),
        CGPoint(x: 198 - 5, y: 104),
        CGPoint(x: 186 - 5, y: 111),
        CGPoint(x: 174 - 5, y: 118),
        CGPoint(x: 162 - 5, y: 125),
        CGPoint(x: 150 - 5, y: 133),
        CGPoint(x: 138 - 5, y: 141),
        CGPoint(x: 126 - 5, y: 151),
        CGPoint(x: 114 - 5, y: 163),
        CGPoint(x: 104 - 5, y: 175),
        CGPoint(x: 100 - 5, y: 187),
        CGPoint(x: 99 - 5, y: 197),
        CGPoint(x: 99 - 5, y: 203),
        CGPoint(x: 101 - 5, y: 210),
        CGPoint(x: 106 - 5, y: 217),
        CGPoint(x: 118 - 5, y: 224),
        CGPoint(x: 130 - 5, y: 228),
        CGPoint(x: 142 - 5, y: 230),
        CGPoint(x: 154 - 5, y: 230),
        CGPoint(x: 166 - 5, y: 230),
        CGPoint(x: 178 - 5, y: 230),
        CGPoint(x: 190 - 5, y: 229),
        CGPoint(x: 202 - 5, y: 228),
        CGPoint(x: 207 - 5, y: 227),
    ]
    
    let do3: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 12),
        CGPoint(x: 232, y: 90 - 12),
        CGPoint(x: 240, y: 100 - 12),
        CGPoint(x: 243, y: 104 - 12),
    ]
    
    let do4: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 12),
        CGPoint(x: 255, y: 75 - 12),
        CGPoint(x: 264, y: 86 - 12),
    ]
    
    let ba1: [CGPoint] = [
        CGPoint(x: 77 - 2, y: 72),
        CGPoint(x: 75 - 2, y: 84),
        CGPoint(x: 74 - 2, y: 96),
        CGPoint(x: 73 - 2, y: 108),
        CGPoint(x: 72 - 2, y: 120),
        CGPoint(x: 71 - 2, y: 132),
        CGPoint(x: 70 - 2, y: 144),
        CGPoint(x: 69.5 - 2, y: 156),
        CGPoint(x: 69 - 2, y: 168),
        CGPoint(x: 69 - 2, y: 180),
        CGPoint(x: 69.5 - 2, y: 192),
        CGPoint(x: 70 - 2, y: 204),
        CGPoint(x: 71 - 2, y: 216),
        CGPoint(x: 73 - 2, y: 228),
        CGPoint(x: 75 - 2, y: 234),
        CGPoint(x: 79 - 2, y: 234),
        CGPoint(x: 83.5 - 2, y: 222),
        CGPoint(x: 88 - 2, y: 210),
        CGPoint(x: 92.5 - 2, y: 198),
        CGPoint(x: 97 - 2, y: 186),
    ]
    
    let ba2: [CGPoint] = [
        CGPoint(x: 134 - 2, y: 114),
        CGPoint(x: 146 - 2, y: 112.5),
        CGPoint(x: 158 - 2, y: 111),
        CGPoint(x: 170 - 2, y: 109.5),
        CGPoint(x: 182 - 2, y: 108),
        CGPoint(x: 194 - 2, y: 106.5),
        CGPoint(x: 206 - 2, y: 105.5),
        CGPoint(x: 218 - 2, y: 104.5),
        CGPoint(x: 231 - 2, y: 104),
    ]
    
    let ba3: [CGPoint] = [
        CGPoint(x: 194 - 2, y: 64),
        CGPoint(x: 194 - 2, y: 76),
        CGPoint(x: 194 - 2, y: 88),
        CGPoint(x: 194 - 2, y: 100),
        CGPoint(x: 194 - 2, y: 112),
        CGPoint(x: 194 - 2, y: 124),
        CGPoint(x: 194 - 2, y: 136),
        CGPoint(x: 194.5 - 2, y: 148),
        CGPoint(x: 195 - 2, y: 160),
        CGPoint(x: 195 - 2, y: 172),
        CGPoint(x: 195.5 - 2, y: 184),
        CGPoint(x: 196 - 2, y: 196),
        CGPoint(x: 196 - 2, y: 208),
        CGPoint(x: 194 - 2, y: 216),
        CGPoint(x: 191 - 2, y: 222),
        CGPoint(x: 188 - 2, y: 225),
        CGPoint(x: 183 - 2, y: 227),
        CGPoint(x: 176 - 2, y: 228),
        CGPoint(x: 166 - 2, y: 229),
        CGPoint(x: 158 - 2, y: 228),
        CGPoint(x: 150 - 2, y: 226),
        CGPoint(x: 145 - 2, y: 224),
        CGPoint(x: 140 - 2, y: 221),
        CGPoint(x: 135 - 2, y: 217),
        CGPoint(x: 132 - 2, y: 214),
        CGPoint(x: 130 - 2, y: 210),
        CGPoint(x: 129 - 2, y: 204),
        CGPoint(x: 131 - 2, y: 199),
        CGPoint(x: 136 - 2, y: 195),
        CGPoint(x: 143 - 2, y: 192),
        CGPoint(x: 149 - 2, y: 190),
        CGPoint(x: 155 - 2, y: 190),
        CGPoint(x: 162 - 2, y: 191),
        CGPoint(x: 168 - 2, y: 192),
        CGPoint(x: 180 - 2, y: 195),
        CGPoint(x: 192 - 2, y: 199),
        CGPoint(x: 204 - 2, y: 204),
        CGPoint(x: 216 - 2, y: 210),
        CGPoint(x: 228 - 2, y: 217),
        CGPoint(x: 237 - 2, y: 224),
    ]
    
    let ba4: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 24),
        CGPoint(x: 232, y: 90 - 24),
        CGPoint(x: 240, y: 100 - 24),
        CGPoint(x: 243, y: 104 - 24),
    ]
    
    let ba5: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 24),
        CGPoint(x: 255, y: 75 - 24),
        CGPoint(x: 264, y: 86 - 24),
    ]
    
    let bi1: [CGPoint] = [
        CGPoint(x: 65 - 2, y: 90),
        CGPoint(x: 77 - 2, y: 87.5),
        CGPoint(x: 89 - 2, y: 85),
        CGPoint(x: 101 - 2, y: 82),
        CGPoint(x: 113 - 2, y: 78),
        CGPoint(x: 125 - 2, y: 75),
        CGPoint(x: 135 - 2, y: 72),
        CGPoint(x: 137 - 2, y: 75),
        CGPoint(x: 127 - 2, y: 87),
        CGPoint(x: 117 - 2, y: 99),
        CGPoint(x: 108 - 2, y: 111),
        CGPoint(x: 100 - 2, y: 123),
        CGPoint(x: 94 - 2, y: 135),
        CGPoint(x: 89 - 2, y: 147),
        CGPoint(x: 86 - 2, y: 159),
        CGPoint(x: 84 - 2, y: 171),
        CGPoint(x: 84 - 2, y: 183),
        CGPoint(x: 85 - 2, y: 195),
        CGPoint(x: 89 - 2, y: 207),
        CGPoint(x: 95 - 2, y: 217),
        CGPoint(x: 106 - 2, y: 227),
        CGPoint(x: 118 - 2, y: 232),
        CGPoint(x: 130 - 2, y: 233),
        CGPoint(x: 142 - 2, y: 232),
        CGPoint(x: 154 - 2, y: 228),
        CGPoint(x: 164 - 2, y: 222),
        CGPoint(x: 174 - 2, y: 214),
        CGPoint(x: 184 - 2, y: 202),
        CGPoint(x: 190 - 2, y: 190),
        CGPoint(x: 195 - 2, y: 178),
        CGPoint(x: 198 - 2, y: 166),
        CGPoint(x: 200 - 2, y: 154),
        CGPoint(x: 202 - 2, y: 142),
        CGPoint(x: 203.5 - 2, y: 130),
        CGPoint(x: 203.5 - 2, y: 130),
        CGPoint(x: 204 - 2, y: 118),
        CGPoint(x: 203.5 - 2, y: 106),
        CGPoint(x: 202 - 2, y: 94),
        CGPoint(x: 201 - 2, y: 90),
        CGPoint(x: 205 - 2, y: 88),
        CGPoint(x: 210 - 2, y: 100),
        CGPoint(x: 217 - 2, y: 112),
        CGPoint(x: 222 - 2, y: 124),
        CGPoint(x: 229 - 2, y: 136),
        CGPoint(x: 236 - 2, y: 148),
        CGPoint(x: 245 - 2, y: 162),
    ]
    
    let bi2: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 20),
        CGPoint(x: 232, y: 90 - 20),
        CGPoint(x: 240, y: 100 - 20),
        CGPoint(x: 243, y: 104 - 20),
    ]
    
    let bi3: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 20),
        CGPoint(x: 255, y: 75 - 20),
        CGPoint(x: 264, y: 86 - 20),
    ]
    
    let bu1: [CGPoint] = [
        CGPoint(x: 130, y: 62),
        CGPoint(x: 142, y: 68),
        CGPoint(x: 154, y: 74),
        CGPoint(x: 166, y: 82),
        CGPoint(x: 174, y: 90),
        CGPoint(x: 162, y: 95),
        CGPoint(x: 150, y: 101),
    ]
    
    let bu2: [CGPoint] = [
        CGPoint(x: 139, y: 149),
        CGPoint(x: 151, y: 161),
        CGPoint(x: 160, y: 173),
        CGPoint(x: 167, y: 185),
        CGPoint(x: 171, y: 197),
        CGPoint(x: 172, y: 209),
        CGPoint(x: 170, y: 217),
        CGPoint(x: 166, y: 225),
        CGPoint(x: 162, y: 230),
        CGPoint(x: 154, y: 235),
        CGPoint(x: 144, y: 236),
        CGPoint(x: 134, y: 234),
        CGPoint(x: 124, y: 230),
        CGPoint(x: 114, y: 222),
    ]
    
    let bu3: [CGPoint] = [
        CGPoint(x: 52, y: 184),
        CGPoint(x: 55, y: 196),
        CGPoint(x: 58, y: 208),
        CGPoint(x: 62, y: 220),
        CGPoint(x: 67, y: 230),
        CGPoint(x: 72, y: 230),
        CGPoint(x: 78, y: 220),
        CGPoint(x: 84, y: 210),
        CGPoint(x: 87, y: 205),
    ]
    
    let bu4: [CGPoint] = [
        CGPoint(x: 217, y: 166),
        CGPoint(x: 229, y: 178),
        CGPoint(x: 239, y: 190),
        CGPoint(x: 247, y: 202),
        CGPoint(x: 250, y: 208),
    ]
    
    let bu5: [CGPoint] = [
        CGPoint(x: 223 - 13, y: 80 - 3),
        CGPoint(x: 232 - 13, y: 90 - 3),
        CGPoint(x: 240 - 13, y: 100 - 3),
        CGPoint(x: 243 - 13, y: 104 - 3),
    ]
    
    let bu6: [CGPoint] = [
        CGPoint(x: 244 - 13, y: 65 - 3),
        CGPoint(x: 255 - 13, y: 75 - 3),
        CGPoint(x: 264 - 13, y: 86 - 3),
    ]
    
    let be1: [CGPoint] = [
        CGPoint(x: 56, y: 158 + 5),
        CGPoint(x: 68, y: 146 + 5),
        CGPoint(x: 80, y: 134 + 5),
        CGPoint(x: 91, y: 122 + 5),
        CGPoint(x: 101, y: 110 + 5),
        CGPoint(x: 106, y: 105 + 5),
        CGPoint(x: 110, y: 102 + 5),
        CGPoint(x: 121, y: 102 + 5),
        CGPoint(x: 133, y: 112 + 5),
        CGPoint(x: 145, y: 122 + 5),
        CGPoint(x: 157, y: 133 + 5),
        CGPoint(x: 169, y: 144 + 5),
        CGPoint(x: 181, y: 154 + 5),
        CGPoint(x: 193, y: 164 + 5),
        CGPoint(x: 205, y: 174 + 5),
        CGPoint(x: 217, y: 184 + 5),
        CGPoint(x: 229, y: 193 + 5),
        CGPoint(x: 241, y: 203 + 5),
    ]
    
    let be2: [CGPoint] = [
        CGPoint(x: 223 - 38, y: 80 + 4),
        CGPoint(x: 232 - 38, y: 90 + 4),
        CGPoint(x: 240 - 38, y: 100 + 4),
        CGPoint(x: 243 - 38, y: 104 + 4),
    ]
    
    let be3: [CGPoint] = [
        CGPoint(x: 244 - 32, y: 65 + 7),
        CGPoint(x: 255 - 32, y: 75 + 7),
        CGPoint(x: 264 - 32, y: 86 + 7),
    ]
    
    let bo1: [CGPoint] = [
        CGPoint(x: 73 - 2, y: 73),
        CGPoint(x: 71.5 - 2, y: 85),
        CGPoint(x: 70 - 2, y: 97),
        CGPoint(x: 69 - 2, y: 109),
        CGPoint(x: 68 - 2, y: 121),
        CGPoint(x: 67 - 2, y: 133),
        CGPoint(x: 66.5 - 2, y: 145),
        CGPoint(x: 66 - 2, y: 157),
        CGPoint(x: 65.5 - 2, y: 169),
        CGPoint(x: 65.5 - 2, y: 181),
        CGPoint(x: 66 - 2, y: 193),
        CGPoint(x: 67 - 2, y: 205),
        CGPoint(x: 68 - 2, y: 217),
        CGPoint(x: 71 - 2, y: 229),
        CGPoint(x: 73 - 2, y: 235),
        CGPoint(x: 75 - 2, y: 235),
        CGPoint(x: 79 - 2, y: 223),
        CGPoint(x: 83 - 2, y: 211),
        CGPoint(x: 88 - 2, y: 199),
        CGPoint(x: 92 - 2, y: 187),
    ]
    
    let bo2: [CGPoint] = [
        CGPoint(x: 137 - 6, y: 78 + 4),
        CGPoint(x: 149 - 6, y: 77 + 4),
        CGPoint(x: 161 - 6, y: 76 + 4),
        CGPoint(x: 173 - 6, y: 75 + 4),
        CGPoint(x: 185 - 6, y: 74 + 4),
        CGPoint(x: 197 - 6, y: 74 + 4),
        CGPoint(x: 209 - 6, y: 74 + 4),
        CGPoint(x: 221 - 6, y: 74 + 4),
        CGPoint(x: 227 - 6, y: 74 + 4),
    ]
    
    let bo3: [CGPoint] = [
        CGPoint(x: 141 - 3, y: 132 + 3),
        CGPoint(x: 153 - 3, y: 132 + 3),
        CGPoint(x: 165 - 3, y: 132 + 3),
        CGPoint(x: 177 - 3, y: 131 + 3),
        CGPoint(x: 189 - 3, y: 130 + 3),
        CGPoint(x: 201 - 3, y: 129 + 3),
        CGPoint(x: 213 - 3, y: 127 + 3),
        CGPoint(x: 226 - 3, y: 125 + 3),
    ]
    
    let bo4: [CGPoint] = [
        CGPoint(x: 191 - 3, y: 76 + 3),
        CGPoint(x: 191 - 3, y: 86 + 3),
        CGPoint(x: 191 - 3, y: 98 + 3),
        CGPoint(x: 191 - 3, y: 110 + 3),
        CGPoint(x: 191 - 3, y: 122 + 3),
        CGPoint(x: 191 - 3, y: 134 + 3),
        CGPoint(x: 191 - 3, y: 146 + 3),
        CGPoint(x: 191 - 3, y: 158 + 3),
        CGPoint(x: 191 - 3, y: 170 + 3),
        CGPoint(x: 191 - 3, y: 182 + 3),
        CGPoint(x: 191 - 3, y: 194 + 3),
        CGPoint(x: 191 - 3, y: 206 + 3),
        CGPoint(x: 191 - 3, y: 215 + 3),
        CGPoint(x: 190 - 3, y: 220 + 3),
        CGPoint(x: 186 - 3, y: 227 + 3),
        CGPoint(x: 180 - 3, y: 230 + 3),
        CGPoint(x: 168 - 3, y: 232 + 3),
        CGPoint(x: 156 - 3, y: 232 + 3),
        CGPoint(x: 144 - 3, y: 229 + 3),
        CGPoint(x: 134 - 3, y: 223 + 3),
        CGPoint(x: 128 - 3, y: 217 + 3),
        CGPoint(x: 126 - 3, y: 212 + 3),
        CGPoint(x: 126 - 3, y: 207 + 3),
        CGPoint(x: 128 - 3, y: 202 + 3),
        CGPoint(x: 136 - 3, y: 196 + 3),
        CGPoint(x: 148 - 3, y: 195 + 3),
        CGPoint(x: 160 - 3, y: 195 + 3),
        CGPoint(x: 172 - 3, y: 197 + 3),
        CGPoint(x: 184 - 3, y: 200 + 3),
        CGPoint(x: 196 - 3, y: 205 + 3),
        CGPoint(x: 208 - 3, y: 212 + 3),
        CGPoint(x: 220 - 3, y: 219 + 3),
        CGPoint(x: 236 - 3, y: 229 + 3),
    ]
    
    let bo5: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 30),
        CGPoint(x: 232, y: 90 - 30),
        CGPoint(x: 240, y: 100 - 30),
        CGPoint(x: 243, y: 104 - 30),
    ]
    
    let bo6: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 30),
        CGPoint(x: 255, y: 75 - 30),
        CGPoint(x: 264, y: 86 - 30),
    ]
    
    let pa1: [CGPoint] = [
        CGPoint(x: 77 - 2, y: 72),
        CGPoint(x: 75 - 2, y: 84),
        CGPoint(x: 74 - 2, y: 96),
        CGPoint(x: 73 - 2, y: 108),
        CGPoint(x: 72 - 2, y: 120),
        CGPoint(x: 71 - 2, y: 132),
        CGPoint(x: 70 - 2, y: 144),
        CGPoint(x: 69.5 - 2, y: 156),
        CGPoint(x: 69 - 2, y: 168),
        CGPoint(x: 69 - 2, y: 180),
        CGPoint(x: 69.5 - 2, y: 192),
        CGPoint(x: 70 - 2, y: 204),
        CGPoint(x: 71 - 2, y: 216),
        CGPoint(x: 73 - 2, y: 228),
        CGPoint(x: 75 - 2, y: 234),
        CGPoint(x: 79 - 2, y: 234),
        CGPoint(x: 83.5 - 2, y: 222),
        CGPoint(x: 88 - 2, y: 210),
        CGPoint(x: 92.5 - 2, y: 198),
        CGPoint(x: 97 - 2, y: 186),
    ]
    
    let pa2: [CGPoint] = [
        CGPoint(x: 134 - 3, y: 114 + 1),
        CGPoint(x: 146 - 3, y: 112.5 + 1),
        CGPoint(x: 158 - 3, y: 111 + 1),
        CGPoint(x: 170 - 3, y: 109.5 + 1),
        CGPoint(x: 182 - 3, y: 108 + 1),
        CGPoint(x: 194 - 3, y: 106.5 + 1),
        CGPoint(x: 206 - 3, y: 105.5 + 1),
        CGPoint(x: 218 - 3, y: 104.5 + 1),
        CGPoint(x: 231 - 3, y: 104 + 1),
    ]
    
    let pa3: [CGPoint] = [
        CGPoint(x: 194 - 2, y: 64 + 1),
        CGPoint(x: 194 - 2, y: 76 + 1),
        CGPoint(x: 194 - 2, y: 88 + 1),
        CGPoint(x: 194 - 2, y: 100 + 1),
        CGPoint(x: 194 - 2, y: 112 + 1),
        CGPoint(x: 194 - 2, y: 124 + 1),
        CGPoint(x: 194 - 2, y: 136 + 1),
        CGPoint(x: 194.5 - 2, y: 148 + 1),
        CGPoint(x: 195 - 2, y: 160 + 1),
        CGPoint(x: 195 - 2, y: 172 + 1),
        CGPoint(x: 195.5 - 2, y: 184 + 1),
        CGPoint(x: 196 - 2, y: 196 + 1),
        CGPoint(x: 196 - 2, y: 208 + 1),
        CGPoint(x: 194 - 2, y: 216 + 1),
        CGPoint(x: 191 - 2, y: 222 + 1),
        CGPoint(x: 188 - 2, y: 225 + 1),
        CGPoint(x: 183 - 2, y: 227 + 1),
        CGPoint(x: 176 - 2, y: 228 + 1),
        CGPoint(x: 166 - 2, y: 229 + 1),
        CGPoint(x: 158 - 2, y: 228 + 1),
        CGPoint(x: 150 - 2, y: 226 + 1),
        CGPoint(x: 145 - 2, y: 224 + 1),
        CGPoint(x: 140 - 2, y: 221 + 1),
        CGPoint(x: 135 - 2, y: 217 + 1),
        CGPoint(x: 132 - 2, y: 214 + 1),
        CGPoint(x: 130 - 2, y: 210 + 1),
        CGPoint(x: 129 - 2, y: 204 + 1),
        CGPoint(x: 131 - 2, y: 199 + 1),
        CGPoint(x: 136 - 2, y: 195 + 1),
        CGPoint(x: 143 - 2, y: 192 + 1),
        CGPoint(x: 149 - 2, y: 190 + 1),
        CGPoint(x: 155 - 2, y: 190 + 1),
        CGPoint(x: 162 - 2, y: 191 + 1),
        CGPoint(x: 168 - 2, y: 192 + 1),
        CGPoint(x: 180 - 2, y: 195 + 1),
        CGPoint(x: 192 - 2, y: 199 + 1),
        CGPoint(x: 204 - 2, y: 204 + 1),
        CGPoint(x: 216 - 2, y: 210 + 1),
        CGPoint(x: 228 - 2, y: 217 + 1),
        CGPoint(x: 237 - 2, y: 224 + 1),
    ]
    
    let pa4: [CGPoint] = [
        CGPoint(x: 241, y: 77),
        CGPoint(x: 236, y: 76),
        CGPoint(x: 230, y: 74),
        CGPoint(x: 224, y: 69),
        CGPoint(x: 221, y: 64),
        CGPoint(x: 220, y: 58),
        CGPoint(x: 220, y: 54),
        CGPoint(x: 222, y: 49),
        CGPoint(x: 226, y: 43),
        CGPoint(x: 231, y: 39),
        CGPoint(x: 240, y: 35),
        CGPoint(x: 245, y: 35.5),
        CGPoint(x: 249, y: 37),
        CGPoint(x: 254, y: 41),
        CGPoint(x: 259, y: 47),
        CGPoint(x: 261, y: 53),
        CGPoint(x: 261, y: 58),
        CGPoint(x: 260, y: 63),
        CGPoint(x: 258, y: 68),
        CGPoint(x: 254, y: 73),
        CGPoint(x: 248, y: 76),
        CGPoint(x: 241, y: 77),
    ]
    
    let pi1: [CGPoint] = [
        CGPoint(x: 65 - 2, y: 90),
        CGPoint(x: 77 - 2, y: 87.5),
        CGPoint(x: 89 - 2, y: 85),
        CGPoint(x: 101 - 2, y: 82),
        CGPoint(x: 113 - 2, y: 78),
        CGPoint(x: 125 - 2, y: 75),
        CGPoint(x: 135 - 2, y: 72),
        CGPoint(x: 137 - 2, y: 75),
        CGPoint(x: 127 - 2, y: 87),
        CGPoint(x: 117 - 2, y: 99),
        CGPoint(x: 108 - 2, y: 111),
        CGPoint(x: 100 - 2, y: 123),
        CGPoint(x: 94 - 2, y: 135),
        CGPoint(x: 89 - 2, y: 147),
        CGPoint(x: 86 - 2, y: 159),
        CGPoint(x: 84 - 2, y: 171),
        CGPoint(x: 84 - 2, y: 183),
        CGPoint(x: 85 - 2, y: 195),
        CGPoint(x: 89 - 2, y: 207),
        CGPoint(x: 95 - 2, y: 217),
        CGPoint(x: 106 - 2, y: 227),
        CGPoint(x: 118 - 2, y: 232),
        CGPoint(x: 130 - 2, y: 233),
        CGPoint(x: 142 - 2, y: 232),
        CGPoint(x: 154 - 2, y: 228),
        CGPoint(x: 164 - 2, y: 222),
        CGPoint(x: 174 - 2, y: 214),
        CGPoint(x: 184 - 2, y: 202),
        CGPoint(x: 190 - 2, y: 190),
        CGPoint(x: 195 - 2, y: 178),
        CGPoint(x: 198 - 2, y: 166),
        CGPoint(x: 200 - 2, y: 154),
        CGPoint(x: 202 - 2, y: 142),
        CGPoint(x: 203.5 - 2, y: 130),
        CGPoint(x: 203.5 - 2, y: 130),
        CGPoint(x: 204 - 2, y: 118),
        CGPoint(x: 203.5 - 2, y: 106),
        CGPoint(x: 202 - 2, y: 94),
        CGPoint(x: 201 - 2, y: 90),
        CGPoint(x: 205 - 2, y: 88),
        CGPoint(x: 210 - 2, y: 100),
        CGPoint(x: 217 - 2, y: 112),
        CGPoint(x: 222 - 2, y: 124),
        CGPoint(x: 229 - 2, y: 136),
        CGPoint(x: 236 - 2, y: 148),
        CGPoint(x: 245 - 2, y: 162),
    ]
    
    let pi2: [CGPoint] = [
        CGPoint(x: 241 + 2, y: 77 + 2),
        CGPoint(x: 236 + 2, y: 76 + 2),
        CGPoint(x: 230 + 2, y: 74 + 2),
        CGPoint(x: 224 + 2, y: 69 + 2),
        CGPoint(x: 221 + 2, y: 64 + 2),
        CGPoint(x: 220 + 2, y: 58 + 2),
        CGPoint(x: 220 + 2, y: 54 + 2),
        CGPoint(x: 222 + 2, y: 49 + 2),
        CGPoint(x: 226 + 2, y: 43 + 2),
        CGPoint(x: 231 + 2, y: 39 + 2),
        CGPoint(x: 240 + 2, y: 35 + 2),
        CGPoint(x: 245 + 2, y: 35.5 + 2),
        CGPoint(x: 249 + 2, y: 37 + 2),
        CGPoint(x: 254 + 2, y: 41 + 2),
        CGPoint(x: 259 + 2, y: 47 + 2),
        CGPoint(x: 261 + 2, y: 53 + 2),
        CGPoint(x: 261 + 2, y: 58 + 2),
        CGPoint(x: 260 + 2, y: 63 + 2),
        CGPoint(x: 258 + 2, y: 68 + 2),
        CGPoint(x: 254 + 2, y: 73 + 2),
        CGPoint(x: 248 + 2, y: 76 + 2),
        CGPoint(x: 241 + 2, y: 77 + 2),
    ]
    
    let pu1: [CGPoint] = [
        CGPoint(x: 130, y: 62),
        CGPoint(x: 142, y: 68),
        CGPoint(x: 154, y: 74),
        CGPoint(x: 166, y: 82),
        CGPoint(x: 174, y: 90),
        CGPoint(x: 162, y: 95),
        CGPoint(x: 150, y: 101),
    ]
    
    let pu2: [CGPoint] = [
        CGPoint(x: 139, y: 149),
        CGPoint(x: 151, y: 161),
        CGPoint(x: 160, y: 173),
        CGPoint(x: 167, y: 185),
        CGPoint(x: 171, y: 197),
        CGPoint(x: 172, y: 209),
        CGPoint(x: 170, y: 217),
        CGPoint(x: 166, y: 225),
        CGPoint(x: 162, y: 230),
        CGPoint(x: 154, y: 235),
        CGPoint(x: 144, y: 236),
        CGPoint(x: 134, y: 234),
        CGPoint(x: 124, y: 230),
        CGPoint(x: 114, y: 222),
    ]
    
    let pu3: [CGPoint] = [
        CGPoint(x: 52, y: 184),
        CGPoint(x: 55, y: 196),
        CGPoint(x: 58, y: 208),
        CGPoint(x: 62, y: 220),
        CGPoint(x: 67, y: 230),
        CGPoint(x: 72, y: 230),
        CGPoint(x: 78, y: 220),
        CGPoint(x: 84, y: 210),
        CGPoint(x: 87, y: 205),
    ]
    
    let pu4: [CGPoint] = [
        CGPoint(x: 217, y: 166),
        CGPoint(x: 229, y: 178),
        CGPoint(x: 239, y: 190),
        CGPoint(x: 247, y: 202),
        CGPoint(x: 250, y: 208),
    ]
    
    let pu5: [CGPoint] = [
        CGPoint(x: 241 - 9, y: 77 + 30),
        CGPoint(x: 236 - 9, y: 76 + 30),
        CGPoint(x: 230 - 9, y: 74 + 30),
        CGPoint(x: 224 - 9, y: 69 + 30),
        CGPoint(x: 221 - 9, y: 64 + 30),
        CGPoint(x: 220 - 9, y: 58 + 30),
        CGPoint(x: 220 - 9, y: 54 + 30),
        CGPoint(x: 222 - 9, y: 49 + 30),
        CGPoint(x: 226 - 9, y: 43 + 30),
        CGPoint(x: 231 - 9, y: 39 + 30),
        CGPoint(x: 240 - 9, y: 35 + 30),
        CGPoint(x: 245 - 9, y: 35.5 + 30),
        CGPoint(x: 249 - 9, y: 37 + 30),
        CGPoint(x: 254 - 9, y: 41 + 30),
        CGPoint(x: 259 - 9, y: 47 + 30),
        CGPoint(x: 261 - 9, y: 53 + 30),
        CGPoint(x: 261 - 9, y: 58 + 30),
        CGPoint(x: 260 - 9, y: 63 + 30),
        CGPoint(x: 258 - 9, y: 68 + 30),
        CGPoint(x: 254 - 9, y: 73 + 30),
        CGPoint(x: 248 - 9, y: 76 + 30),
        CGPoint(x: 241 - 9, y: 77 + 30),
    ]
    
    let pe1: [CGPoint] = [
        CGPoint(x: 56, y: 158 + 5),
        CGPoint(x: 68, y: 146 + 5),
        CGPoint(x: 80, y: 134 + 5),
        CGPoint(x: 91, y: 122 + 5),
        CGPoint(x: 101, y: 110 + 5),
        CGPoint(x: 106, y: 105 + 5),
        CGPoint(x: 110, y: 102 + 5),
        CGPoint(x: 121, y: 102 + 5),
        CGPoint(x: 133, y: 112 + 5),
        CGPoint(x: 145, y: 122 + 5),
        CGPoint(x: 157, y: 133 + 5),
        CGPoint(x: 169, y: 144 + 5),
        CGPoint(x: 181, y: 154 + 5),
        CGPoint(x: 193, y: 164 + 5),
        CGPoint(x: 205, y: 174 + 5),
        CGPoint(x: 217, y: 184 + 5),
        CGPoint(x: 229, y: 193 + 5),
        CGPoint(x: 241, y: 203 + 5),
    ]
    
    let pe2: [CGPoint] = [
        CGPoint(x: 241 - 30, y: 77 + 33),
        CGPoint(x: 236 - 30, y: 76 + 33),
        CGPoint(x: 230 - 30, y: 74 + 33),
        CGPoint(x: 224 - 30, y: 69 + 33),
        CGPoint(x: 221 - 30, y: 64 + 33),
        CGPoint(x: 220 - 30, y: 58 + 33),
        CGPoint(x: 220 - 30, y: 54 + 33),
        CGPoint(x: 222 - 30, y: 49 + 33),
        CGPoint(x: 226 - 30, y: 43 + 33),
        CGPoint(x: 231 - 30, y: 39 + 33),
        CGPoint(x: 240 - 30, y: 35 + 33),
        CGPoint(x: 245 - 30, y: 35.5 + 33),
        CGPoint(x: 249 - 30, y: 37 + 33),
        CGPoint(x: 254 - 30, y: 41 + 33),
        CGPoint(x: 259 - 30, y: 47 + 33),
        CGPoint(x: 261 - 30, y: 53 + 33),
        CGPoint(x: 261 - 30, y: 58 + 33),
        CGPoint(x: 260 - 30, y: 63 + 33),
        CGPoint(x: 258 - 30, y: 68 + 33),
        CGPoint(x: 254 - 30, y: 73 + 33),
        CGPoint(x: 248 - 30, y: 76 + 33),
        CGPoint(x: 241 - 30, y: 77 + 33),
    ]
    
    let po1: [CGPoint] = [
        CGPoint(x: 73 - 2, y: 73),
        CGPoint(x: 71.5 - 2, y: 85),
        CGPoint(x: 70 - 2, y: 97),
        CGPoint(x: 69 - 2, y: 109),
        CGPoint(x: 68 - 2, y: 121),
        CGPoint(x: 67 - 2, y: 133),
        CGPoint(x: 66.5 - 2, y: 145),
        CGPoint(x: 66 - 2, y: 157),
        CGPoint(x: 65.5 - 2, y: 169),
        CGPoint(x: 65.5 - 2, y: 181),
        CGPoint(x: 66 - 2, y: 193),
        CGPoint(x: 67 - 2, y: 205),
        CGPoint(x: 68 - 2, y: 217),
        CGPoint(x: 71 - 2, y: 229),
        CGPoint(x: 73 - 2, y: 235),
        CGPoint(x: 75 - 2, y: 235),
        CGPoint(x: 79 - 2, y: 223),
        CGPoint(x: 83 - 2, y: 211),
        CGPoint(x: 88 - 2, y: 199),
        CGPoint(x: 92 - 2, y: 187),
    ]
    
    let po2: [CGPoint] = [
        CGPoint(x: 137 - 6, y: 78 + 4),
        CGPoint(x: 149 - 6, y: 77 + 4),
        CGPoint(x: 161 - 6, y: 76 + 4),
        CGPoint(x: 173 - 6, y: 75 + 4),
        CGPoint(x: 185 - 6, y: 74 + 4),
        CGPoint(x: 197 - 6, y: 74 + 4),
        CGPoint(x: 209 - 6, y: 74 + 4),
        CGPoint(x: 221 - 6, y: 74 + 4),
        CGPoint(x: 227 - 6, y: 74 + 4),
    ]
    
    let po3: [CGPoint] = [
        CGPoint(x: 141 - 3, y: 132 + 3),
        CGPoint(x: 153 - 3, y: 132 + 3),
        CGPoint(x: 165 - 3, y: 132 + 3),
        CGPoint(x: 177 - 3, y: 131 + 3),
        CGPoint(x: 189 - 3, y: 130 + 3),
        CGPoint(x: 201 - 3, y: 129 + 3),
        CGPoint(x: 213 - 3, y: 127 + 3),
        CGPoint(x: 226 - 3, y: 125 + 3),
    ]
    
    let po4: [CGPoint] = [
        CGPoint(x: 191 - 3, y: 76 + 3),
        CGPoint(x: 191 - 3, y: 86 + 3),
        CGPoint(x: 191 - 3, y: 98 + 3),
        CGPoint(x: 191 - 3, y: 110 + 3),
        CGPoint(x: 191 - 3, y: 122 + 3),
        CGPoint(x: 191 - 3, y: 134 + 3),
        CGPoint(x: 191 - 3, y: 146 + 3),
        CGPoint(x: 191 - 3, y: 158 + 3),
        CGPoint(x: 191 - 3, y: 170 + 3),
        CGPoint(x: 191 - 3, y: 182 + 3),
        CGPoint(x: 191 - 3, y: 194 + 3),
        CGPoint(x: 191 - 3, y: 206 + 3),
        CGPoint(x: 191 - 3, y: 215 + 3),
        CGPoint(x: 190 - 3, y: 220 + 3),
        CGPoint(x: 186 - 3, y: 227 + 3),
        CGPoint(x: 180 - 3, y: 230 + 3),
        CGPoint(x: 168 - 3, y: 232 + 3),
        CGPoint(x: 156 - 3, y: 232 + 3),
        CGPoint(x: 144 - 3, y: 229 + 3),
        CGPoint(x: 134 - 3, y: 223 + 3),
        CGPoint(x: 128 - 3, y: 217 + 3),
        CGPoint(x: 126 - 3, y: 212 + 3),
        CGPoint(x: 126 - 3, y: 207 + 3),
        CGPoint(x: 128 - 3, y: 202 + 3),
        CGPoint(x: 136 - 3, y: 196 + 3),
        CGPoint(x: 148 - 3, y: 195 + 3),
        CGPoint(x: 160 - 3, y: 195 + 3),
        CGPoint(x: 172 - 3, y: 197 + 3),
        CGPoint(x: 184 - 3, y: 200 + 3),
        CGPoint(x: 196 - 3, y: 205 + 3),
        CGPoint(x: 208 - 3, y: 212 + 3),
        CGPoint(x: 220 - 3, y: 219 + 3),
        CGPoint(x: 236 - 3, y: 229 + 3),
    ]
    
    let po5: [CGPoint] = [
        CGPoint(x: 241 + 7, y: 77),
        CGPoint(x: 236 + 7, y: 76),
        CGPoint(x: 230 + 7, y: 74),
        CGPoint(x: 224 + 7, y: 69),
        CGPoint(x: 221 + 7, y: 64),
        CGPoint(x: 220 + 7, y: 58),
        CGPoint(x: 220 + 7, y: 54),
        CGPoint(x: 222 + 7, y: 49),
        CGPoint(x: 226 + 7, y: 43),
        CGPoint(x: 231 + 7, y: 39),
        CGPoint(x: 240 + 7, y: 35),
        CGPoint(x: 245 + 7, y: 35.5),
        CGPoint(x: 249 + 7, y: 37),
        CGPoint(x: 254 + 7, y: 41),
        CGPoint(x: 259 + 7, y: 47),
        CGPoint(x: 261 + 7, y: 53),
        CGPoint(x: 261 + 7, y: 58),
        CGPoint(x: 260 + 7, y: 63),
        CGPoint(x: 258 + 7, y: 68),
        CGPoint(x: 254 + 7, y: 73),
        CGPoint(x: 248 + 7, y: 76),
        CGPoint(x: 241 + 7, y: 77),
    ]
}
