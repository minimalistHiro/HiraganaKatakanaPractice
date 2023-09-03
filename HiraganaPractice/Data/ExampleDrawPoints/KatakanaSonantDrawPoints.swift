//
//  KatakanaSonantDrawPoints.swift
//  HiraganaPractice
//
//  Created by 金子広樹 on 2023/09/02.
//

import SwiftUI

class KatakanaSonantDrawPoints: ObservableObject {
    
    let ga1: [CGPoint] = [
        CGPoint(x: 75 - 2, y: 117),
        CGPoint(x: 87 - 2, y: 116),
        CGPoint(x: 99 - 2, y: 115),
        CGPoint(x: 111 - 2, y: 114),
        CGPoint(x: 123 - 2, y: 113),
        CGPoint(x: 135 - 2, y: 112),
        CGPoint(x: 147 - 2, y: 111),
        CGPoint(x: 159 - 2, y: 110),
        CGPoint(x: 171 - 2, y: 109),
        CGPoint(x: 183 - 2, y: 108),
        CGPoint(x: 195 - 2, y: 107),
        CGPoint(x: 207 - 2, y: 106),
        CGPoint(x: 216 - 2, y: 112),
        CGPoint(x: 215 - 2, y: 124),
        CGPoint(x: 214 - 2, y: 136),
        CGPoint(x: 212 - 2, y: 148),
        CGPoint(x: 209 - 2, y: 160),
        CGPoint(x: 206 - 2, y: 172),
        CGPoint(x: 202.5 - 2, y: 184),
        CGPoint(x: 199 - 2, y: 196),
        CGPoint(x: 195 - 2, y: 208),
        CGPoint(x: 190 - 2, y: 220),
        CGPoint(x: 184 - 2, y: 232),
        CGPoint(x: 179 - 2, y: 238),
        CGPoint(x: 167 - 2, y: 231),
        CGPoint(x: 155 - 2, y: 224),
        CGPoint(x: 143 - 2, y: 217),
    ]
    
    let ga2: [CGPoint] = [
        CGPoint(x: 151 - 2, y: 61),
        CGPoint(x: 149.5 - 2, y: 73),
        CGPoint(x: 147 - 2, y: 85),
        CGPoint(x: 145 - 2, y: 97),
        CGPoint(x: 142 - 2, y: 109),
        CGPoint(x: 139 - 2, y: 121),
        CGPoint(x: 135 - 2, y: 133),
        CGPoint(x: 130 - 2, y: 145),
        CGPoint(x: 124 - 2, y: 157),
        CGPoint(x: 118 - 2, y: 169),
        CGPoint(x: 110 - 2, y: 181),
        CGPoint(x: 102 - 2, y: 193),
        CGPoint(x: 92 - 2, y: 205),
        CGPoint(x: 82 - 2, y: 215),
        CGPoint(x: 72 - 2, y: 224),
        CGPoint(x: 66 - 2, y: 230),
    ]
    
    let ga3: [CGPoint] = [
        CGPoint(x: 223 - 1, y: 80 - 15),
        CGPoint(x: 232 - 1, y: 90 - 15),
        CGPoint(x: 240 - 1, y: 100 - 15),
        CGPoint(x: 243 - 1, y: 104 - 15),
    ]
    
    let ga4: [CGPoint] = [
        CGPoint(x: 244 - 1, y: 65 - 15),
        CGPoint(x: 255 - 1, y: 75 - 15),
        CGPoint(x: 264 - 1, y: 86 - 15),
    ]
    
    let gi1: [CGPoint] = [
        CGPoint(x: 76, y: 115),
        CGPoint(x: 88, y: 113),
        CGPoint(x: 100, y: 111),
        CGPoint(x: 112, y: 109),
        CGPoint(x: 124, y: 107),
        CGPoint(x: 136, y: 105),
        CGPoint(x: 148, y: 102.5),
        CGPoint(x: 160, y: 100),
        CGPoint(x: 172, y: 97.5),
        CGPoint(x: 184, y: 95),
        CGPoint(x: 196, y: 92),
        CGPoint(x: 200, y: 91),
    ]
    
    let gi2: [CGPoint] = [
        CGPoint(x: 67, y: 184),
        CGPoint(x: 79, y: 181),
        CGPoint(x: 91, y: 178),
        CGPoint(x: 103, y: 175.5),
        CGPoint(x: 115, y: 173),
        CGPoint(x: 127, y: 170.5),
        CGPoint(x: 139, y: 168),
        CGPoint(x: 151, y: 165.5),
        CGPoint(x: 163, y: 163),
        CGPoint(x: 175, y: 160.5),
        CGPoint(x: 187, y: 158),
        CGPoint(x: 199, y: 155.5),
        CGPoint(x: 211, y: 153),
        CGPoint(x: 223, y: 150.5),
        CGPoint(x: 235, y: 148),
    ]
    
    let gi3: [CGPoint] = [
        CGPoint(x: 131, y: 57),
        CGPoint(x: 133.5, y: 69),
        CGPoint(x: 136, y: 81),
        CGPoint(x: 138.5, y: 93),
        CGPoint(x: 141, y: 105),
        CGPoint(x: 143.5, y: 117),
        CGPoint(x: 146, y: 129),
        CGPoint(x: 148.5, y: 141),
        CGPoint(x: 151, y: 153),
        CGPoint(x: 153.5, y: 165),
        CGPoint(x: 156, y: 177),
        CGPoint(x: 158.5, y: 189),
        CGPoint(x: 160.5, y: 201),
        CGPoint(x: 162.5, y: 213),
        CGPoint(x: 165, y: 225),
        CGPoint(x: 167, y: 237),
        CGPoint(x: 168, y: 242),
    ]
    
    let gi4: [CGPoint] = [
        CGPoint(x: 223 - 3, y: 80 - 18),
        CGPoint(x: 232 - 3, y: 90 - 18),
        CGPoint(x: 240 - 3, y: 100 - 18),
        CGPoint(x: 243 - 3, y: 104 - 18),
    ]
    
    let gi5: [CGPoint] = [
        CGPoint(x: 244 - 3, y: 65 - 18),
        CGPoint(x: 255 - 3, y: 75 - 18),
        CGPoint(x: 264 - 3, y: 86 - 18),
    ]
    
    let gu1: [CGPoint] = [
        CGPoint(x: 144 - 8, y: 69 + 4),
        CGPoint(x: 139 - 8, y: 79 + 4),
        CGPoint(x: 132 - 8, y: 89 + 4),
        CGPoint(x: 126 - 8, y: 99 + 4),
        CGPoint(x: 118 - 8, y: 109 + 4),
        CGPoint(x: 110 - 8, y: 119 + 4),
        CGPoint(x: 99 - 8, y: 129 + 4),
        CGPoint(x: 87 - 8, y: 138 + 4),
    ]
    
    let gu2: [CGPoint] = [
        CGPoint(x: 142 - 8, y: 77 + 4),
        CGPoint(x: 154 - 8, y: 77 + 4),
        CGPoint(x: 166 - 8, y: 77 + 4),
        CGPoint(x: 178 - 8, y: 77 + 4),
        CGPoint(x: 190 - 8, y: 77 + 4),
        CGPoint(x: 202 - 8, y: 77 + 4),
        CGPoint(x: 212 - 8, y: 77 + 4),
        CGPoint(x: 211 - 8, y: 89 + 4),
        CGPoint(x: 208 - 8, y: 101 + 4),
        CGPoint(x: 204 - 8, y: 113 + 4),
        CGPoint(x: 199 - 8, y: 125 + 4),
        CGPoint(x: 193 - 8, y: 137 + 4),
        CGPoint(x: 186 - 8, y: 149 + 4),
        CGPoint(x: 178 - 8, y: 161 + 4),
        CGPoint(x: 169 - 8, y: 173 + 4),
        CGPoint(x: 160 - 8, y: 185 + 4),
        CGPoint(x: 148 - 8, y: 196 + 4),
        CGPoint(x: 136 - 8, y: 206 + 4),
        CGPoint(x: 124 - 8, y: 215 + 4),
        CGPoint(x: 112 - 8, y: 223 + 4),
        CGPoint(x: 100 - 8, y: 231 + 4),
        CGPoint(x: 90 - 8, y: 237 + 4),
    ]
    
    let gu3: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 27),
        CGPoint(x: 232, y: 90 - 27),
        CGPoint(x: 240, y: 100 - 27),
        CGPoint(x: 243, y: 104 - 27),
    ]
    
    let gu4: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 27),
        CGPoint(x: 255, y: 75 - 27),
        CGPoint(x: 264, y: 86 - 27),
    ]
    
    let ge1: [CGPoint] = [
        CGPoint(x: 116, y: 67 + 2),
        CGPoint(x: 112, y: 79 + 2),
        CGPoint(x: 107, y: 91 + 2),
        CGPoint(x: 101, y: 103 + 2),
        CGPoint(x: 95, y: 115 + 2),
        CGPoint(x: 87, y: 127 + 2),
        CGPoint(x: 78, y: 139 + 2),
        CGPoint(x: 68, y: 149 + 2),
        CGPoint(x: 63, y: 155 + 2),
    ]
    
    let ge2: [CGPoint] = [
        CGPoint(x: 93, y: 115 + 2),
        CGPoint(x: 105, y: 115 + 2),
        CGPoint(x: 117, y: 114.5 + 2),
        CGPoint(x: 129, y: 114 + 2),
        CGPoint(x: 141, y: 113.5 + 2),
        CGPoint(x: 153, y: 113 + 2),
        CGPoint(x: 165, y: 112 + 2),
        CGPoint(x: 177, y: 111 + 2),
        CGPoint(x: 189, y: 110 + 2),
        CGPoint(x: 201, y: 109 + 2),
        CGPoint(x: 213, y: 108 + 2),
        CGPoint(x: 225, y: 107 + 2),
        CGPoint(x: 237, y: 106 + 2),
    ]
    
    let ge3: [CGPoint] = [
        CGPoint(x: 180, y: 110 + 2),
        CGPoint(x: 179, y: 122 + 2),
        CGPoint(x: 178, y: 134 + 2),
        CGPoint(x: 176, y: 146 + 2),
        CGPoint(x: 173, y: 158 + 2),
        CGPoint(x: 169, y: 170 + 2),
        CGPoint(x: 165, y: 182 + 2),
        CGPoint(x: 159, y: 194 + 2),
        CGPoint(x: 151, y: 206 + 2),
        CGPoint(x: 141, y: 218 + 2),
        CGPoint(x: 129, y: 229 + 2),
        CGPoint(x: 118, y: 236 + 2),
    ]
    
    let ge4: [CGPoint] = [
        CGPoint(x: 223 - 2, y: 80 - 26),
        CGPoint(x: 232 - 2, y: 90 - 26),
        CGPoint(x: 240 - 2, y: 100 - 26),
        CGPoint(x: 243 - 2, y: 104 - 26),
    ]
    
    let ge5: [CGPoint] = [
        CGPoint(x: 244 - 2, y: 65 - 26),
        CGPoint(x: 255 - 2, y: 75 - 26),
        CGPoint(x: 264 - 2, y: 86 - 26),
    ]
    
    let go1: [CGPoint] = [
        CGPoint(x: 86 - 5, y: 104 + 3),
        CGPoint(x: 98 - 5, y: 103 + 3),
        CGPoint(x: 110 - 5, y: 102 + 3),
        CGPoint(x: 123 - 5, y: 101 + 3),
        CGPoint(x: 135 - 5, y: 100 + 3),
        CGPoint(x: 147 - 5, y: 99 + 3),
        CGPoint(x: 159 - 5, y: 98 + 3),
        CGPoint(x: 171 - 5, y: 97 + 3),
        CGPoint(x: 183 - 5, y: 96 + 3),
        CGPoint(x: 195 - 5, y: 95 + 3),
        CGPoint(x: 207 - 5, y: 94 + 3),
        CGPoint(x: 213 - 5, y: 98 + 3),
        CGPoint(x: 212 - 5, y: 110 + 3),
        CGPoint(x: 211 - 5, y: 122 + 3),
        CGPoint(x: 210 - 5, y: 134 + 3),
        CGPoint(x: 209 - 5, y: 146 + 3),
        CGPoint(x: 207.5 - 5, y: 158 + 3),
        CGPoint(x: 206 - 5, y: 170 + 3),
        CGPoint(x: 204.5 - 5, y: 182 + 3),
        CGPoint(x: 203 - 5, y: 194 + 3),
        CGPoint(x: 202 - 5, y: 204 + 3),
    ]
    
    let go2: [CGPoint] = [
        CGPoint(x: 85 - 5, y: 216 + 3),
        CGPoint(x: 97 - 5, y: 215 + 3),
        CGPoint(x: 109 - 5, y: 214 + 3),
        CGPoint(x: 121 - 5, y: 213 + 3),
        CGPoint(x: 133 - 5, y: 212 + 3),
        CGPoint(x: 145 - 5, y: 211 + 3),
        CGPoint(x: 157 - 5, y: 210 + 3),
        CGPoint(x: 169 - 5, y: 209 + 3),
        CGPoint(x: 181 - 5, y: 208 + 3),
        CGPoint(x: 193 - 5, y: 207 + 3),
        CGPoint(x: 205 - 5, y: 206.5 + 3),
        CGPoint(x: 211 - 5, y: 206.5 + 3),
    ]
    
    let go3: [CGPoint] = [
        CGPoint(x: 223 - 2, y: 80 - 20),
        CGPoint(x: 232 - 2, y: 90 - 20),
        CGPoint(x: 240 - 2, y: 100 - 20),
        CGPoint(x: 243 - 2, y: 104 - 20),
    ]
    
    let go4: [CGPoint] = [
        CGPoint(x: 244 - 2, y: 65 - 20),
        CGPoint(x: 255 - 2, y: 75 - 20),
        CGPoint(x: 264 - 2, y: 86 - 20),
    ]
    
    let za1: [CGPoint] = [
        CGPoint(x: 53 - 2, y: 126),
        CGPoint(x: 65 - 2, y: 125),
        CGPoint(x: 77 - 2, y: 124),
        CGPoint(x: 89 - 2, y: 123),
        CGPoint(x: 101 - 2, y: 122),
        CGPoint(x: 113 - 2, y: 121),
        CGPoint(x: 125 - 2, y: 120),
        CGPoint(x: 137 - 2, y: 119),
        CGPoint(x: 149 - 2, y: 118),
        CGPoint(x: 161 - 2, y: 117),
        CGPoint(x: 173 - 2, y: 116.5),
        CGPoint(x: 185 - 2, y: 116),
        CGPoint(x: 197 - 2, y: 115),
        CGPoint(x: 209 - 2, y: 114),
        CGPoint(x: 221 - 2, y: 113),
        CGPoint(x: 233 - 2, y: 112),
        CGPoint(x: 245 - 2, y: 111),
        CGPoint(x: 247 - 2, y: 111),
    ]
    
    let za2: [CGPoint] = [
        CGPoint(x: 110 - 2, y: 71),
        CGPoint(x: 110 - 2, y: 83),
        CGPoint(x: 110 - 2, y: 95),
        CGPoint(x: 110 - 2, y: 107),
        CGPoint(x: 110 - 2, y: 119),
        CGPoint(x: 110 - 2, y: 131),
        CGPoint(x: 110 - 2, y: 143),
        CGPoint(x: 110 - 2, y: 155),
        CGPoint(x: 110 - 2, y: 167),
        CGPoint(x: 110 - 2, y: 172),
    ]
    
    let za3: [CGPoint] = [
        CGPoint(x: 194 - 2, y: 62),
        CGPoint(x: 194 - 2, y: 74),
        CGPoint(x: 194 - 2, y: 86),
        CGPoint(x: 194 - 2, y: 98),
        CGPoint(x: 194 - 2, y: 110),
        CGPoint(x: 194 - 2, y: 122),
        CGPoint(x: 193.5 - 2, y: 134),
        CGPoint(x: 192.5 - 2, y: 146),
        CGPoint(x: 191 - 2, y: 158),
        CGPoint(x: 188.5 - 2, y: 170),
        CGPoint(x: 186 - 2, y: 182),
        CGPoint(x: 182 - 2, y: 194),
        CGPoint(x: 176 - 2, y: 206),
        CGPoint(x: 169 - 2, y: 218),
        CGPoint(x: 160 - 2, y: 230),
        CGPoint(x: 148 - 2, y: 241),
        CGPoint(x: 144 - 2, y: 244),
    ]
    
    let za4: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 25),
        CGPoint(x: 232, y: 90 - 25),
        CGPoint(x: 240, y: 100 - 25),
        CGPoint(x: 243, y: 104 - 25),
    ]
    
    let za5: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 25),
        CGPoint(x: 255, y: 75 - 25),
        CGPoint(x: 264, y: 86 - 25),
    ]
    
    let zi1: [CGPoint] = [
        CGPoint(x: 94, y: 71),
        CGPoint(x: 106, y: 78),
        CGPoint(x: 118, y: 84),
        CGPoint(x: 130, y: 91),
        CGPoint(x: 138, y: 98),
    ]
    
    let zi2: [CGPoint] = [
        CGPoint(x: 67, y: 126),
        CGPoint(x: 79, y: 131),
        CGPoint(x: 91, y: 136),
        CGPoint(x: 103, y: 143),
        CGPoint(x: 115, y: 151),
    ]
    
    let zi3: [CGPoint] = [
        CGPoint(x: 92, y: 235),
        CGPoint(x: 104, y: 230),
        CGPoint(x: 116, y: 224),
        CGPoint(x: 128, y: 218),
        CGPoint(x: 140, y: 212),
        CGPoint(x: 152, y: 205),
        CGPoint(x: 164, y: 198),
        CGPoint(x: 176, y: 190),
        CGPoint(x: 188, y: 180),
        CGPoint(x: 200, y: 169),
        CGPoint(x: 211, y: 157),
        CGPoint(x: 220, y: 145),
        CGPoint(x: 229, y: 133),
        CGPoint(x: 236, y: 121),
        CGPoint(x: 238, y: 118),
    ]
    
    let zi4: [CGPoint] = [
        CGPoint(x: 223 - 8, y: 80 - 22),
        CGPoint(x: 232 - 8, y: 90 - 22),
        CGPoint(x: 240 - 8, y: 100 - 22),
        CGPoint(x: 243 - 8, y: 104 - 22),
    ]
    
    let zi5: [CGPoint] = [
        CGPoint(x: 244 - 8, y: 65 - 24),
        CGPoint(x: 255 - 8, y: 75 - 24),
        CGPoint(x: 264 - 8, y: 86 - 24),
    ]
    
    let zu1: [CGPoint] = [
        CGPoint(x: 89 - 2, y: 87 + 2),
        CGPoint(x: 101 - 2, y: 86.5 + 2),
        CGPoint(x: 113 - 2, y: 86 + 2),
        CGPoint(x: 125 - 2, y: 85 + 2),
        CGPoint(x: 137 - 2, y: 84 + 2),
        CGPoint(x: 149 - 2, y: 83 + 2),
        CGPoint(x: 161 - 2, y: 82 + 2),
        CGPoint(x: 173 - 2, y: 81 + 2),
        CGPoint(x: 185 - 2, y: 80 + 2),
        CGPoint(x: 195 - 2, y: 79 + 2),
        CGPoint(x: 199 - 2, y: 83 + 2),
        CGPoint(x: 194 - 2, y: 95 + 2),
        CGPoint(x: 188 - 2, y: 107 + 2),
        CGPoint(x: 180 - 2, y: 119 + 2),
        CGPoint(x: 172 - 2, y: 131 + 2),
        CGPoint(x: 163 - 2, y: 143 + 2),
        CGPoint(x: 152 - 2, y: 155 + 2),
        CGPoint(x: 141 - 2, y: 167 + 2),
        CGPoint(x: 129 - 2, y: 179 + 2),
        CGPoint(x: 117 - 2, y: 190 + 2),
        CGPoint(x: 105 - 2, y: 200 + 2),
        CGPoint(x: 93 - 2, y: 209 + 2),
        CGPoint(x: 81 - 2, y: 217 + 2),
        CGPoint(x: 69 - 2, y: 225 + 2),
        CGPoint(x: 63 - 2, y: 229 + 2),
    ]
    
    let zu2: [CGPoint] = [
        CGPoint(x: 152 - 2, y: 158 + 2),
        CGPoint(x: 164 - 2, y: 168 + 2),
        CGPoint(x: 176 - 2, y: 178 + 2),
        CGPoint(x: 188 - 2, y: 188 + 2),
        CGPoint(x: 200 - 2, y: 199 + 2),
        CGPoint(x: 212 - 2, y: 210 + 2),
        CGPoint(x: 226 - 2, y: 224 + 2),
    ]
    
    let zu3: [CGPoint] = [
        CGPoint(x: 223 - 3, y: 80 - 22),
        CGPoint(x: 232 - 3, y: 90 - 22),
        CGPoint(x: 240 - 3, y: 100 - 22),
        CGPoint(x: 243 - 3, y: 104 - 22),
    ]
    
    let zu4: [CGPoint] = [
        CGPoint(x: 244 - 3, y: 65 - 24),
        CGPoint(x: 255 - 3, y: 75 - 24),
        CGPoint(x: 264 - 3, y: 86 - 24),
    ]
    
    let ze1: [CGPoint] = [
        CGPoint(x: 65 - 4, y: 141 + 1),
        CGPoint(x: 77 - 4, y: 138 + 1),
        CGPoint(x: 89 - 4, y: 135 + 1),
        CGPoint(x: 101 - 4, y: 132 + 1),
        CGPoint(x: 113 - 4, y: 129 + 1),
        CGPoint(x: 125 - 4, y: 126 + 1),
        CGPoint(x: 137 - 4, y: 123 + 1),
        CGPoint(x: 149 - 4, y: 120 + 1),
        CGPoint(x: 161 - 4, y: 117 + 1),
        CGPoint(x: 173 - 4, y: 114 + 1),
        CGPoint(x: 185 - 4, y: 110.5 + 1),
        CGPoint(x: 197 - 4, y: 107 + 1),
        CGPoint(x: 209 - 4, y: 103.5 + 1),
        CGPoint(x: 221 - 4, y: 100 + 1),
        CGPoint(x: 228 - 4, y: 100 + 1),
        CGPoint(x: 230 - 4, y: 103 + 1),
        CGPoint(x: 224 - 4, y: 115 + 1),
        CGPoint(x: 217 - 4, y: 127 + 1),
        CGPoint(x: 208 - 4, y: 139 + 1),
        CGPoint(x: 198 - 4, y: 151 + 1),
        CGPoint(x: 188 - 4, y: 163 + 1),
    ]
    
    let ze2: [CGPoint] = [
        CGPoint(x: 119 - 5, y: 65 + 3),
        CGPoint(x: 119.5 - 5, y: 77 + 3),
        CGPoint(x: 120 - 5, y: 89 + 3),
        CGPoint(x: 120 - 5, y: 101 + 3),
        CGPoint(x: 120 - 5, y: 113 + 3),
        CGPoint(x: 120 - 5, y: 125 + 3),
        CGPoint(x: 120 - 5, y: 137 + 3),
        CGPoint(x: 120 - 5, y: 149 + 3),
        CGPoint(x: 120 - 5, y: 161 + 3),
        CGPoint(x: 120 - 5, y: 173 + 3),
        CGPoint(x: 120 - 5, y: 185 + 3),
        CGPoint(x: 120 - 5, y: 197 + 3),
        CGPoint(x: 122 - 5, y: 207 + 3),
        CGPoint(x: 127 - 5, y: 214 + 3),
        CGPoint(x: 135 - 5, y: 219 + 3),
        CGPoint(x: 145 - 5, y: 221 + 3),
        CGPoint(x: 157 - 5, y: 221 + 3),
        CGPoint(x: 169 - 5, y: 221 + 3),
        CGPoint(x: 181 - 5, y: 221 + 3),
        CGPoint(x: 193 - 5, y: 221 + 3),
        CGPoint(x: 205 - 5, y: 221 + 3),
        CGPoint(x: 217 - 5, y: 220 + 3),
    ]
    
    let ze3: [CGPoint] = [
        CGPoint(x: 223 + 1, y: 80 - 25),
        CGPoint(x: 232 + 1, y: 90 - 25),
        CGPoint(x: 240 + 1, y: 100 - 25),
        CGPoint(x: 243 + 1, y: 104 - 25),
    ]
    
    let ze4: [CGPoint] = [
        CGPoint(x: 244 + 1, y: 65 - 25),
        CGPoint(x: 255 + 1, y: 75 - 25),
        CGPoint(x: 264 + 1, y: 86 - 25),
    ]
    
    let zo1: [CGPoint] = [
        CGPoint(x: 80 - 8, y: 85 + 2),
        CGPoint(x: 91 - 8, y: 97 + 2),
        CGPoint(x: 102 - 8, y: 109 + 2),
        CGPoint(x: 111 - 8, y: 121 + 2),
        CGPoint(x: 113 - 8, y: 124 + 2),
    ]
    
    let zo2: [CGPoint] = [
        CGPoint(x: 222 - 9, y: 76 + 7),
        CGPoint(x: 220 - 8, y: 88 + 2),
        CGPoint(x: 217 - 8, y: 100 + 2),
        CGPoint(x: 213 - 8, y: 112 + 2),
        CGPoint(x: 208 - 8, y: 124 + 2),
        CGPoint(x: 203 - 8, y: 136 + 2),
        CGPoint(x: 197 - 8, y: 148 + 2),
        CGPoint(x: 190 - 8, y: 160 + 2),
        CGPoint(x: 182 - 8, y: 172 + 2),
        CGPoint(x: 173 - 8, y: 184 + 2),
        CGPoint(x: 161 - 8, y: 196 + 2),
        CGPoint(x: 149 - 8, y: 207 + 2),
        CGPoint(x: 137 - 8, y: 217 + 2),
        CGPoint(x: 125 - 8, y: 225 + 2),
        CGPoint(x: 113 - 8, y: 233 + 2),
    ]
    
    let zo3: [CGPoint] = [
        CGPoint(x: 223 + 1, y: 80 - 27),
        CGPoint(x: 232 + 1, y: 90 - 27),
        CGPoint(x: 240 + 1, y: 100 - 27),
        CGPoint(x: 243 + 1, y: 104 - 27),
    ]
    
    let zo4: [CGPoint] = [
        CGPoint(x: 244 + 1, y: 65 - 30),
        CGPoint(x: 255 + 1, y: 75 - 30),
        CGPoint(x: 264 + 1, y: 86 - 30),
    ]
    
    let da1: [CGPoint] = [
        CGPoint(x: 143 - 7, y: 70 + 2),
        CGPoint(x: 136 - 7, y: 82 + 2),
        CGPoint(x: 129 - 7, y: 94 + 2),
        CGPoint(x: 121 - 7, y: 106 + 2),
        CGPoint(x: 110 - 7, y: 118 + 2),
        CGPoint(x: 98 - 7, y: 129 + 2),
        CGPoint(x: 84 - 7, y: 140 + 2),
    ]
    
    let da2: [CGPoint] = [
        CGPoint(x: 141 - 7, y: 77 + 2),
        CGPoint(x: 153 - 7, y: 77 + 2),
        CGPoint(x: 165 - 7, y: 77 + 2),
        CGPoint(x: 177 - 7, y: 77 + 2),
        CGPoint(x: 189 - 7, y: 77 + 2),
        CGPoint(x: 201 - 7, y: 77 + 2),
        CGPoint(x: 213 - 7, y: 77 + 2),
        CGPoint(x: 216 - 7, y: 81 + 2),
        CGPoint(x: 213 - 7, y: 93 + 2),
        CGPoint(x: 209 - 7, y: 105 + 2),
        CGPoint(x: 204 - 7, y: 117 + 2),
        CGPoint(x: 199 - 7, y: 129 + 2),
        CGPoint(x: 193 - 7, y: 141 + 2),
        CGPoint(x: 186 - 7, y: 153 + 2),
        CGPoint(x: 179 - 7, y: 165 + 2),
        CGPoint(x: 170 - 7, y: 177 + 2),
        CGPoint(x: 160 - 7, y: 189 + 2),
        CGPoint(x: 148 - 7, y: 199 + 2),
        CGPoint(x: 136 - 7, y: 209 + 2),
        CGPoint(x: 124 - 7, y: 219 + 2),
        CGPoint(x: 112 - 7, y: 228 + 2),
        CGPoint(x: 100 - 7, y: 236 + 2),
        CGPoint(x: 93 - 7, y: 240 + 2),
    ]
    
    let da3: [CGPoint] = [
        CGPoint(x: 110 - 7, y: 120 + 2),
        CGPoint(x: 122 - 7, y: 130 + 2),
        CGPoint(x: 134 - 7, y: 139 + 2),
        CGPoint(x: 146 - 7, y: 148 + 2),
        CGPoint(x: 158 - 7, y: 157 + 2),
        CGPoint(x: 170 - 7, y: 165 + 2),
    ]
    
    let da4: [CGPoint] = [
        CGPoint(x: 223 + 1, y: 80 - 27),
        CGPoint(x: 232 + 1, y: 90 - 27),
        CGPoint(x: 240 + 1, y: 100 - 27),
        CGPoint(x: 243 + 1, y: 104 - 27),
    ]
    
    let da5: [CGPoint] = [
        CGPoint(x: 244 + 1, y: 65 - 29),
        CGPoint(x: 255 + 1, y: 75 - 29),
        CGPoint(x: 264 + 1, y: 86 - 29),
    ]
    
    let di1: [CGPoint] = [
        CGPoint(x: 185 - 3, y: 56 + 1),
        CGPoint(x: 173 - 3, y: 63 + 1),
        CGPoint(x: 161 - 3, y: 70 + 1),
        CGPoint(x: 149 - 3, y: 76 + 1),
        CGPoint(x: 137 - 3, y: 81 + 1),
        CGPoint(x: 125 - 3, y: 85 + 1),
        CGPoint(x: 113 - 3, y: 89 + 1),
        CGPoint(x: 101 - 3, y: 92 + 1),
        CGPoint(x: 93 - 3, y: 94 + 1),
    ]
    
    let di2: [CGPoint] = [
        CGPoint(x: 61 - 3, y: 149 + 1),
        CGPoint(x: 73 - 3, y: 148 + 1),
        CGPoint(x: 85 - 3, y: 147 + 1),
        CGPoint(x: 97 - 3, y: 145.5 + 1),
        CGPoint(x: 109 - 3, y: 144 + 1),
        CGPoint(x: 121 - 3, y: 142.5 + 1),
        CGPoint(x: 133 - 3, y: 141.5 + 1),
        CGPoint(x: 145 - 3, y: 140.5 + 1),
        CGPoint(x: 157 - 3, y: 140 + 1),
        CGPoint(x: 169 - 3, y: 139.5 + 1),
        CGPoint(x: 181 - 3, y: 139 + 1),
        CGPoint(x: 193 - 3, y: 138.5 + 1),
        CGPoint(x: 205 - 3, y: 138 + 1),
        CGPoint(x: 217 - 3, y: 137.5 + 1),
        CGPoint(x: 229 - 3, y: 137 + 1),
        CGPoint(x: 239 - 3, y: 137 + 1),
    ]
    
    let di3: [CGPoint] = [
        CGPoint(x: 153 - 3, y: 75),
        CGPoint(x: 153 - 3, y: 87),
        CGPoint(x: 153 - 3, y: 99),
        CGPoint(x: 153 - 3, y: 111),
        CGPoint(x: 153 - 3, y: 123),
        CGPoint(x: 153 - 3, y: 135),
        CGPoint(x: 153 - 3, y: 147),
        CGPoint(x: 153 - 3, y: 159),
        CGPoint(x: 151.5 - 3, y: 171),
        CGPoint(x: 149 - 3, y: 183),
        CGPoint(x: 145 - 3, y: 195),
        CGPoint(x: 140 - 3, y: 207),
        CGPoint(x: 133 - 3, y: 219),
        CGPoint(x: 124 - 3, y: 231),
        CGPoint(x: 111 - 3, y: 243),
    ]
    
    let di4: [CGPoint] = [
        CGPoint(x: 223 - 2, y: 80 - 13),
        CGPoint(x: 232 - 2, y: 90 - 13),
        CGPoint(x: 240 - 2, y: 100 - 13),
        CGPoint(x: 243 - 2, y: 104 - 13),
    ]
    
    let di5: [CGPoint] = [
        CGPoint(x: 244 - 2, y: 65 - 13),
        CGPoint(x: 255 - 2, y: 75 - 13),
        CGPoint(x: 264 - 2, y: 86 - 13),
    ]
    
    let du1: [CGPoint] = [
        CGPoint(x: 67 - 7, y: 89 + 1),
        CGPoint(x: 75 - 7, y: 101 + 1),
        CGPoint(x: 82 - 7, y: 113 + 1),
        CGPoint(x: 88 - 7, y: 125 + 1),
        CGPoint(x: 90 - 7, y: 129 + 1),
    ]
    
    let du2: [CGPoint] = [
        CGPoint(x: 129 - 7, y: 68 + 1),
        CGPoint(x: 134 - 7, y: 80 + 1),
        CGPoint(x: 139 - 7, y: 92 + 1),
        CGPoint(x: 143 - 7, y: 104 + 1),
        CGPoint(x: 147 - 7, y: 113 + 1),
    ]
    
    let du3: [CGPoint] = [
        CGPoint(x: 229 - 9, y: 76 + 9),
        CGPoint(x: 227 - 7, y: 88 + 1),
        CGPoint(x: 224 - 7, y: 100 + 1),
        CGPoint(x: 221 - 7, y: 112 + 1),
        CGPoint(x: 217 - 7, y: 124 + 1),
        CGPoint(x: 212 - 7, y: 136 + 1),
        CGPoint(x: 207 - 7, y: 148 + 1),
        CGPoint(x: 201 - 7, y: 160 + 1),
        CGPoint(x: 193 - 7, y: 172 + 1),
        CGPoint(x: 184 - 7, y: 184 + 1),
        CGPoint(x: 173 - 7, y: 196 + 1),
        CGPoint(x: 163 - 7, y: 206 + 1),
        CGPoint(x: 151 - 7, y: 216 + 1),
        CGPoint(x: 139 - 7, y: 224 + 1),
        CGPoint(x: 127 - 7, y: 230 + 1),
    ]
    
    let du4: [CGPoint] = [
        CGPoint(x: 223, y: 80 - 28),
        CGPoint(x: 232, y: 90 - 28),
        CGPoint(x: 240, y: 100 - 28),
        CGPoint(x: 243, y: 104 - 28),
    ]
    
    let du5: [CGPoint] = [
        CGPoint(x: 244, y: 65 - 28),
        CGPoint(x: 255, y: 75 - 28),
        CGPoint(x: 264, y: 86 - 28),
    ]
    
    let de1: [CGPoint] = [
        CGPoint(x: 100 - 5, y: 75),
        CGPoint(x: 112 - 5, y: 75),
        CGPoint(x: 124 - 5, y: 74.5),
        CGPoint(x: 136 - 5, y: 74),
        CGPoint(x: 148 - 5, y: 73),
        CGPoint(x: 160 - 5, y: 72),
        CGPoint(x: 172 - 5, y: 71),
        CGPoint(x: 184 - 5, y: 69),
        CGPoint(x: 194 - 5, y: 67.5),
    ]
    
    let de2: [CGPoint] = [
        CGPoint(x: 60 - 5, y: 140),
        CGPoint(x: 72 - 5, y: 139),
        CGPoint(x: 84 - 5, y: 138),
        CGPoint(x: 96 - 5, y: 137),
        CGPoint(x: 108 - 5, y: 136),
        CGPoint(x: 120 - 5, y: 135),
        CGPoint(x: 132 - 5, y: 134),
        CGPoint(x: 144 - 5, y: 133.5),
        CGPoint(x: 156 - 5, y: 133),
        CGPoint(x: 168 - 5, y: 132.5),
        CGPoint(x: 180 - 5, y: 132),
        CGPoint(x: 192 - 5, y: 131.5),
        CGPoint(x: 204 - 5, y: 131),
        CGPoint(x: 216 - 5, y: 130.5),
        CGPoint(x: 228 - 5, y: 130),
        CGPoint(x: 240 - 5, y: 129.5),
    ]
    
    let de3: [CGPoint] = [
        CGPoint(x: 155 - 5, y: 134),
        CGPoint(x: 155 - 5, y: 146),
        CGPoint(x: 155 - 5, y: 158),
        CGPoint(x: 154 - 5, y: 170),
        CGPoint(x: 152 - 5, y: 182),
        CGPoint(x: 148 - 5, y: 194),
        CGPoint(x: 142 - 5, y: 206),
        CGPoint(x: 134 - 5, y: 218),
        CGPoint(x: 124 - 5, y: 230),
        CGPoint(x: 111 - 5, y: 239),
    ]
    
    let de4: [CGPoint] = [
        CGPoint(x: 223 + 1, y: 80 - 25),
        CGPoint(x: 232 + 1, y: 90 - 25),
        CGPoint(x: 240 + 1, y: 100 - 25),
        CGPoint(x: 243 + 1, y: 104 - 25),
    ]
    
    let de5: [CGPoint] = [
        CGPoint(x: 244 + 1, y: 65 - 25),
        CGPoint(x: 255 + 1, y: 75 - 25),
        CGPoint(x: 264 + 1, y: 86 - 25),
    ]
    
    let do1: [CGPoint] = [
        CGPoint(x: 131, y: 60),
        CGPoint(x: 131, y: 72),
        CGPoint(x: 131, y: 84),
        CGPoint(x: 131, y: 96),
        CGPoint(x: 131, y: 108),
        CGPoint(x: 131, y: 120),
        CGPoint(x: 131, y: 132),
        CGPoint(x: 131, y: 144),
        CGPoint(x: 131, y: 156),
        CGPoint(x: 131, y: 168),
        CGPoint(x: 131, y: 180),
        CGPoint(x: 131, y: 192),
        CGPoint(x: 131, y: 204),
        CGPoint(x: 131, y: 216),
        CGPoint(x: 131, y: 228),
        CGPoint(x: 131, y: 240),
    ]
    
    let do2: [CGPoint] = [
        CGPoint(x: 131, y: 126),
        CGPoint(x: 143, y: 131),
        CGPoint(x: 155, y: 136),
        CGPoint(x: 167, y: 141),
        CGPoint(x: 179, y: 146),
        CGPoint(x: 191, y: 152),
        CGPoint(x: 203, y: 160),
        CGPoint(x: 210, y: 165),
    ]
    
    let do3: [CGPoint] = [
        CGPoint(x: 223 - 23, y: 80 - 3),
        CGPoint(x: 232 - 23, y: 90 - 3),
        CGPoint(x: 240 - 23, y: 100 - 3),
        CGPoint(x: 243 - 23, y: 104 - 3),
    ]
    
    let do4: [CGPoint] = [
        CGPoint(x: 244 - 23, y: 65 - 3),
        CGPoint(x: 255 - 23, y: 75 - 3),
        CGPoint(x: 264 - 23, y: 86 - 3),
    ]
    
    let ba1: [CGPoint] = [
        CGPoint(x: 108, y: 116),
        CGPoint(x: 103, y: 128),
        CGPoint(x: 98, y: 140),
        CGPoint(x: 92, y: 152),
        CGPoint(x: 85, y: 164),
        CGPoint(x: 76, y: 176),
        CGPoint(x: 67, y: 188),
        CGPoint(x: 55, y: 202),
    ]
    
    let ba2: [CGPoint] = [
        CGPoint(x: 191, y: 109),
        CGPoint(x: 199, y: 121),
        CGPoint(x: 208, y: 133),
        CGPoint(x: 217, y: 145),
        CGPoint(x: 225, y: 157),
        CGPoint(x: 233, y: 169),
        CGPoint(x: 240, y: 181),
        CGPoint(x: 245, y: 192),
    ]
    
    let ba3: [CGPoint] = [
        CGPoint(x: 223 - 8, y: 80 - 13),
        CGPoint(x: 232 - 8, y: 90 - 13),
        CGPoint(x: 240 - 8, y: 100 - 13),
        CGPoint(x: 243 - 8, y: 104 - 13),
    ]
    
    let ba4: [CGPoint] = [
        CGPoint(x: 244 - 8, y: 65 - 13),
        CGPoint(x: 255 - 8, y: 75 - 13),
        CGPoint(x: 264 - 8, y: 86 - 13),
    ]
    
    let bi1: [CGPoint] = [
        CGPoint(x: 203, y: 110 + 3),
        CGPoint(x: 191, y: 113 + 3),
        CGPoint(x: 179, y: 116 + 3),
        CGPoint(x: 167, y: 118 + 3),
        CGPoint(x: 155, y: 120.5 + 3),
        CGPoint(x: 143, y: 123 + 3),
        CGPoint(x: 131, y: 125.5 + 3),
        CGPoint(x: 119, y: 127.5 + 3),
        CGPoint(x: 107, y: 129 + 3),
        CGPoint(x: 95, y: 130 + 3),
    ]
    
    let bi2: [CGPoint] = [
        CGPoint(x: 92, y: 66 + 3),
        CGPoint(x: 92, y: 78 + 3),
        CGPoint(x: 92, y: 90 + 3),
        CGPoint(x: 92, y: 102 + 3),
        CGPoint(x: 92, y: 114 + 3),
        CGPoint(x: 92, y: 126 + 3),
        CGPoint(x: 92, y: 138 + 3),
        CGPoint(x: 92, y: 150 + 3),
        CGPoint(x: 92, y: 162 + 3),
        CGPoint(x: 92, y: 174 + 3),
        CGPoint(x: 92, y: 186 + 3),
        CGPoint(x: 93, y: 198 + 3),
        CGPoint(x: 94, y: 203 + 3),
        CGPoint(x: 96, y: 208 + 3),
        CGPoint(x: 100, y: 213 + 3),
        CGPoint(x: 110, y: 218 + 3),
        CGPoint(x: 120, y: 220 + 3),
        CGPoint(x: 132, y: 220 + 3),
        CGPoint(x: 144, y: 220 + 3),
        CGPoint(x: 156, y: 220 + 3),
        CGPoint(x: 168, y: 220 + 3),
        CGPoint(x: 180, y: 220 + 3),
        CGPoint(x: 192, y: 219 + 3),
        CGPoint(x: 204, y: 218 + 3),
        CGPoint(x: 216, y: 217 + 3),
        CGPoint(x: 219, y: 217 + 3),
    ]
    
    let bi3: [CGPoint] = [
        CGPoint(x: 223 - 9, y: 80 - 15),
        CGPoint(x: 232 - 9, y: 90 - 15),
        CGPoint(x: 240 - 9, y: 100 - 15),
        CGPoint(x: 243 - 9, y: 104 - 15),
    ]
    
    let bi4: [CGPoint] = [
        CGPoint(x: 244 - 9, y: 65 - 15),
        CGPoint(x: 255 - 9, y: 75 - 15),
        CGPoint(x: 264 - 9, y: 86 - 15),
    ]
    
    let bu1: [CGPoint] = [
        CGPoint(x: 79 - 9, y: 91 + 3),
        CGPoint(x: 91 - 9, y: 90 + 3),
        CGPoint(x: 103 - 9, y: 89 + 3),
        CGPoint(x: 115 - 9, y: 88 + 3),
        CGPoint(x: 127 - 9, y: 87 + 3),
        CGPoint(x: 139 - 9, y: 86 + 3),
        CGPoint(x: 151 - 9, y: 85 + 3),
        CGPoint(x: 163 - 9, y: 84.5 + 3),
        CGPoint(x: 175 - 9, y: 84 + 3),
        CGPoint(x: 187 - 9, y: 83.5 + 3),
        CGPoint(x: 199 - 9, y: 83 + 3),
        CGPoint(x: 215 - 9, y: 82.5 + 3),
        CGPoint(x: 219 - 9, y: 89 + 3),
        CGPoint(x: 217 - 9, y: 101 + 3),
        CGPoint(x: 214 - 9, y: 113 + 3),
        CGPoint(x: 211 - 9, y: 125 + 3),
        CGPoint(x: 207 - 9, y: 137 + 3),
        CGPoint(x: 201 - 9, y: 149 + 3),
        CGPoint(x: 195 - 9, y: 161 + 3),
        CGPoint(x: 187 - 9, y: 173 + 3),
        CGPoint(x: 177 - 9, y: 185 + 3),
        CGPoint(x: 165 - 9, y: 197 + 3),
        CGPoint(x: 153 - 9, y: 207 + 3),
        CGPoint(x: 141 - 9, y: 216 + 3),
        CGPoint(x: 129 - 9, y: 224 + 3),
        CGPoint(x: 121 - 9, y: 229 + 3),
    ]
    
    let bu2: [CGPoint] = [
        CGPoint(x: 223 + 1, y: 80 - 27),
        CGPoint(x: 232 + 1, y: 90 - 27),
        CGPoint(x: 240 + 1, y: 100 - 27),
        CGPoint(x: 243 + 1, y: 104 - 27),
    ]
    
    let bu3: [CGPoint] = [
        CGPoint(x: 244 + 1, y: 65 - 27),
        CGPoint(x: 255 + 1, y: 75 - 27),
        CGPoint(x: 264 + 1, y: 86 - 27),
    ]
    
    let be1: [CGPoint] = [
        CGPoint(x: 55, y: 162),
        CGPoint(x: 67, y: 150),
        CGPoint(x: 78, y: 138),
        CGPoint(x: 89, y: 126),
        CGPoint(x: 101, y: 114),
        CGPoint(x: 113, y: 102),
        CGPoint(x: 116, y: 102),
        CGPoint(x: 128, y: 110),
        CGPoint(x: 140, y: 119),
        CGPoint(x: 152, y: 128),
        CGPoint(x: 164, y: 137),
        CGPoint(x: 176, y: 147),
        CGPoint(x: 188, y: 157),
        CGPoint(x: 200, y: 166),
        CGPoint(x: 212, y: 176),
        CGPoint(x: 224, y: 186),
        CGPoint(x: 236, y: 196),
        CGPoint(x: 241, y: 200),
    ]
    
    let be2: [CGPoint] = [
        CGPoint(x: 223 - 38, y: 80),
        CGPoint(x: 232 - 38, y: 90),
        CGPoint(x: 240 - 38, y: 100),
        CGPoint(x: 243 - 38, y: 104),
    ]
    
    let be3: [CGPoint] = [
        CGPoint(x: 244 - 33, y: 65 + 2),
        CGPoint(x: 255 - 33, y: 75 + 2),
        CGPoint(x: 264 - 33, y: 86 + 2),
    ]
    
    let bo1: [CGPoint] = [
        CGPoint(x: 72, y: 114 + 3),
        CGPoint(x: 84, y: 113 + 3),
        CGPoint(x: 96, y: 112 + 3),
        CGPoint(x: 108, y: 111 + 3),
        CGPoint(x: 120, y: 110 + 3),
        CGPoint(x: 132, y: 109 + 3),
        CGPoint(x: 144, y: 108 + 3),
        CGPoint(x: 156, y: 107 + 3),
        CGPoint(x: 168, y: 106 + 3),
        CGPoint(x: 180, y: 105.5 + 3),
        CGPoint(x: 192, y: 105 + 3),
        CGPoint(x: 204, y: 104 + 3),
        CGPoint(x: 216, y: 103 + 3),
        CGPoint(x: 224, y: 102.5 + 3),
    ]
    
    let bo2: [CGPoint] = [
        CGPoint(x: 149, y: 60),
        CGPoint(x: 149, y: 72),
        CGPoint(x: 149, y: 84),
        CGPoint(x: 149, y: 96),
        CGPoint(x: 149, y: 108),
        CGPoint(x: 149, y: 120),
        CGPoint(x: 149.5, y: 132),
        CGPoint(x: 149.5, y: 144),
        CGPoint(x: 149.5, y: 156),
        CGPoint(x: 149.5, y: 168),
        CGPoint(x: 150, y: 180),
        CGPoint(x: 150, y: 192),
        CGPoint(x: 150, y: 204),
        CGPoint(x: 150.5, y: 216),
        CGPoint(x: 150.5, y: 228),
        CGPoint(x: 150.5, y: 240),
        CGPoint(x: 138, y: 235),
        CGPoint(x: 126, y: 230),
        CGPoint(x: 114, y: 225),
    ]
    
    let bo3: [CGPoint] = [
        CGPoint(x: 90, y: 159),
        CGPoint(x: 85, y: 171),
        CGPoint(x: 79, y: 183),
        CGPoint(x: 72, y: 195),
        CGPoint(x: 64, y: 207),
        CGPoint(x: 61, y: 211),
    ]
    
    let bo4: [CGPoint] = [
        CGPoint(x: 201, y: 155),
        CGPoint(x: 210, y: 167),
        CGPoint(x: 219, y: 179),
        CGPoint(x: 227, y: 191),
        CGPoint(x: 233, y: 203),
    ]
    
    let bo5: [CGPoint] = [
        CGPoint(x: 223 - 3, y: 80 - 30),
        CGPoint(x: 232 - 3, y: 90 - 30),
        CGPoint(x: 240 - 3, y: 100 - 30),
        CGPoint(x: 243 - 3, y: 104 - 30),
    ]
    
    let bo6: [CGPoint] = [
        CGPoint(x: 244 - 3, y: 65 - 30),
        CGPoint(x: 255 - 3, y: 75 - 30),
        CGPoint(x: 264 - 3, y: 86 - 30),
    ]
    
    let pa1: [CGPoint] = [
        CGPoint(x: 108, y: 116),
        CGPoint(x: 103, y: 128),
        CGPoint(x: 98, y: 140),
        CGPoint(x: 92, y: 152),
        CGPoint(x: 85, y: 164),
        CGPoint(x: 76, y: 176),
        CGPoint(x: 67, y: 188),
        CGPoint(x: 55, y: 202),
    ]
    
    let pa2: [CGPoint] = [
        CGPoint(x: 191, y: 109),
        CGPoint(x: 199, y: 121),
        CGPoint(x: 208, y: 133),
        CGPoint(x: 217, y: 145),
        CGPoint(x: 225, y: 157),
        CGPoint(x: 233, y: 169),
        CGPoint(x: 240, y: 181),
        CGPoint(x: 245, y: 192),
    ]
    
    let pa3: [CGPoint] = [
        CGPoint(x: 241 - 3, y: 77 + 15),
        CGPoint(x: 236 - 3, y: 76 + 15),
        CGPoint(x: 230 - 3, y: 74 + 15),
        CGPoint(x: 224 - 3, y: 69 + 15),
        CGPoint(x: 221 - 3, y: 64 + 15),
        CGPoint(x: 220 - 3, y: 58 + 15),
        CGPoint(x: 220 - 3, y: 54 + 15),
        CGPoint(x: 222 - 3, y: 49 + 15),
        CGPoint(x: 226 - 3, y: 43 + 15),
        CGPoint(x: 231 - 3, y: 39 + 15),
        CGPoint(x: 240 - 3, y: 35 + 15),
        CGPoint(x: 245 - 3, y: 35.5 + 15),
        CGPoint(x: 249 - 3, y: 37 + 15),
        CGPoint(x: 254 - 3, y: 41 + 15),
        CGPoint(x: 259 - 3, y: 47 + 15),
        CGPoint(x: 261 - 3, y: 53 + 15),
        CGPoint(x: 261 - 3, y: 58 + 15),
        CGPoint(x: 260 - 3, y: 63 + 15),
        CGPoint(x: 258 - 3, y: 68 + 15),
        CGPoint(x: 254 - 3, y: 73 + 15),
        CGPoint(x: 248 - 3, y: 76 + 15),
        CGPoint(x: 241 - 3, y: 77 + 15),
    ]
    
    let pi1: [CGPoint] = [
        CGPoint(x: 203, y: 110 + 3),
        CGPoint(x: 191, y: 113 + 3),
        CGPoint(x: 179, y: 116 + 3),
        CGPoint(x: 167, y: 118 + 3),
        CGPoint(x: 155, y: 120.5 + 3),
        CGPoint(x: 143, y: 123 + 3),
        CGPoint(x: 131, y: 125.5 + 3),
        CGPoint(x: 119, y: 127.5 + 3),
        CGPoint(x: 107, y: 129 + 3),
        CGPoint(x: 95, y: 130 + 3),
    ]
    
    let pi2: [CGPoint] = [
        CGPoint(x: 92, y: 66 + 3),
        CGPoint(x: 92, y: 78 + 3),
        CGPoint(x: 92, y: 90 + 3),
        CGPoint(x: 92, y: 102 + 3),
        CGPoint(x: 92, y: 114 + 3),
        CGPoint(x: 92, y: 126 + 3),
        CGPoint(x: 92, y: 138 + 3),
        CGPoint(x: 92, y: 150 + 3),
        CGPoint(x: 92, y: 162 + 3),
        CGPoint(x: 92, y: 174 + 3),
        CGPoint(x: 92, y: 186 + 3),
        CGPoint(x: 93, y: 198 + 3),
        CGPoint(x: 94, y: 203 + 3),
        CGPoint(x: 96, y: 208 + 3),
        CGPoint(x: 100, y: 213 + 3),
        CGPoint(x: 110, y: 218 + 3),
        CGPoint(x: 120, y: 220 + 3),
        CGPoint(x: 132, y: 220 + 3),
        CGPoint(x: 144, y: 220 + 3),
        CGPoint(x: 156, y: 220 + 3),
        CGPoint(x: 168, y: 220 + 3),
        CGPoint(x: 180, y: 220 + 3),
        CGPoint(x: 192, y: 219 + 3),
        CGPoint(x: 204, y: 218 + 3),
        CGPoint(x: 216, y: 217 + 3),
        CGPoint(x: 219, y: 217 + 3),
    ]
    
    let pi3: [CGPoint] = [
        CGPoint(x: 241 - 3, y: 77 + 10),
        CGPoint(x: 236 - 3, y: 76 + 10),
        CGPoint(x: 230 - 3, y: 74 + 10),
        CGPoint(x: 224 - 3, y: 69 + 10),
        CGPoint(x: 221 - 3, y: 64 + 10),
        CGPoint(x: 220 - 3, y: 58 + 10),
        CGPoint(x: 220 - 3, y: 54 + 10),
        CGPoint(x: 222 - 3, y: 49 + 10),
        CGPoint(x: 226 - 3, y: 43 + 10),
        CGPoint(x: 231 - 3, y: 39 + 10),
        CGPoint(x: 240 - 3, y: 35 + 10),
        CGPoint(x: 245 - 3, y: 35.5 + 10),
        CGPoint(x: 249 - 3, y: 37 + 10),
        CGPoint(x: 254 - 3, y: 41 + 10),
        CGPoint(x: 259 - 3, y: 47 + 10),
        CGPoint(x: 261 - 3, y: 53 + 10),
        CGPoint(x: 261 - 3, y: 58 + 10),
        CGPoint(x: 260 - 3, y: 63 + 10),
        CGPoint(x: 258 - 3, y: 68 + 10),
        CGPoint(x: 254 - 3, y: 73 + 10),
        CGPoint(x: 248 - 3, y: 76 + 10),
        CGPoint(x: 241 - 3, y: 77 + 10),
    ]
    
    let pu1: [CGPoint] = [
        CGPoint(x: 79 - 9, y: 91 + 3),
        CGPoint(x: 91 - 9, y: 90 + 3),
        CGPoint(x: 103 - 9, y: 89 + 3),
        CGPoint(x: 115 - 9, y: 88 + 3),
        CGPoint(x: 127 - 9, y: 87 + 3),
        CGPoint(x: 139 - 9, y: 86 + 3),
        CGPoint(x: 151 - 9, y: 85 + 3),
        CGPoint(x: 163 - 9, y: 84.5 + 3),
        CGPoint(x: 175 - 9, y: 84 + 3),
        CGPoint(x: 187 - 9, y: 83.5 + 3),
        CGPoint(x: 199 - 9, y: 83 + 3),
        CGPoint(x: 215 - 9, y: 82.5 + 3),
        CGPoint(x: 219 - 9, y: 89 + 3),
        CGPoint(x: 217 - 9, y: 101 + 3),
        CGPoint(x: 214 - 9, y: 113 + 3),
        CGPoint(x: 211 - 9, y: 125 + 3),
        CGPoint(x: 207 - 9, y: 137 + 3),
        CGPoint(x: 201 - 9, y: 149 + 3),
        CGPoint(x: 195 - 9, y: 161 + 3),
        CGPoint(x: 187 - 9, y: 173 + 3),
        CGPoint(x: 177 - 9, y: 185 + 3),
        CGPoint(x: 165 - 9, y: 197 + 3),
        CGPoint(x: 153 - 9, y: 207 + 3),
        CGPoint(x: 141 - 9, y: 216 + 3),
        CGPoint(x: 129 - 9, y: 224 + 3),
        CGPoint(x: 121 - 9, y: 229 + 3),
    ]
    
    let pu2: [CGPoint] = [
        CGPoint(x: 241 + 6, y: 77),
        CGPoint(x: 236 + 6, y: 76),
        CGPoint(x: 230 + 6, y: 74),
        CGPoint(x: 224 + 6, y: 69),
        CGPoint(x: 221 + 6, y: 64),
        CGPoint(x: 220 + 6, y: 58),
        CGPoint(x: 220 + 6, y: 54),
        CGPoint(x: 222 + 6, y: 49),
        CGPoint(x: 226 + 6, y: 43),
        CGPoint(x: 231 + 6, y: 39),
        CGPoint(x: 240 + 6, y: 35),
        CGPoint(x: 245 + 6, y: 35.5),
        CGPoint(x: 249 + 6, y: 37),
        CGPoint(x: 254 + 6, y: 41),
        CGPoint(x: 259 + 6, y: 47),
        CGPoint(x: 261 + 6, y: 53),
        CGPoint(x: 261 + 6, y: 58),
        CGPoint(x: 260 + 6, y: 63),
        CGPoint(x: 258 + 6, y: 68),
        CGPoint(x: 254 + 6, y: 73),
        CGPoint(x: 248 + 6, y: 76),
        CGPoint(x: 241 + 6, y: 77),
    ]
    
    let pe1: [CGPoint] = [
        CGPoint(x: 55, y: 162),
        CGPoint(x: 67, y: 150),
        CGPoint(x: 78, y: 138),
        CGPoint(x: 89, y: 126),
        CGPoint(x: 101, y: 114),
        CGPoint(x: 113, y: 102),
        CGPoint(x: 116, y: 102),
        CGPoint(x: 128, y: 110),
        CGPoint(x: 140, y: 119),
        CGPoint(x: 152, y: 128),
        CGPoint(x: 164, y: 137),
        CGPoint(x: 176, y: 147),
        CGPoint(x: 188, y: 157),
        CGPoint(x: 200, y: 166),
        CGPoint(x: 212, y: 176),
        CGPoint(x: 224, y: 186),
        CGPoint(x: 236, y: 196),
        CGPoint(x: 241, y: 200),
    ]
    
    let pe2: [CGPoint] = [
        CGPoint(x: 241 - 33, y: 77 + 26),
        CGPoint(x: 236 - 33, y: 76 + 26),
        CGPoint(x: 230 - 33, y: 74 + 26),
        CGPoint(x: 224 - 33, y: 69 + 26),
        CGPoint(x: 221 - 33, y: 64 + 26),
        CGPoint(x: 220 - 33, y: 58 + 26),
        CGPoint(x: 220 - 33, y: 54 + 26),
        CGPoint(x: 222 - 33, y: 49 + 26),
        CGPoint(x: 226 - 33, y: 43 + 26),
        CGPoint(x: 231 - 33, y: 39 + 26),
        CGPoint(x: 240 - 33, y: 35 + 26),
        CGPoint(x: 245 - 33, y: 35.5 + 26),
        CGPoint(x: 249 - 33, y: 37 + 26),
        CGPoint(x: 254 - 33, y: 41 + 26),
        CGPoint(x: 259 - 33, y: 47 + 26),
        CGPoint(x: 261 - 33, y: 53 + 26),
        CGPoint(x: 261 - 33, y: 58 + 26),
        CGPoint(x: 260 - 33, y: 63 + 26),
        CGPoint(x: 258 - 33, y: 68 + 26),
        CGPoint(x: 254 - 33, y: 73 + 26),
        CGPoint(x: 248 - 33, y: 76 + 26),
        CGPoint(x: 241 - 33, y: 77 + 26),
    ]
    
    let po1: [CGPoint] = [
        CGPoint(x: 72, y: 114 + 3),
        CGPoint(x: 84, y: 113 + 3),
        CGPoint(x: 96, y: 112 + 3),
        CGPoint(x: 108, y: 111 + 3),
        CGPoint(x: 120, y: 110 + 3),
        CGPoint(x: 132, y: 109 + 3),
        CGPoint(x: 144, y: 108 + 3),
        CGPoint(x: 156, y: 107 + 3),
        CGPoint(x: 168, y: 106 + 3),
        CGPoint(x: 180, y: 105.5 + 3),
        CGPoint(x: 192, y: 105 + 3),
        CGPoint(x: 204, y: 104 + 3),
        CGPoint(x: 216, y: 103 + 3),
        CGPoint(x: 224, y: 102.5 + 3),
    ]
    
    let po2: [CGPoint] = [
        CGPoint(x: 149, y: 60),
        CGPoint(x: 149, y: 72),
        CGPoint(x: 149, y: 84),
        CGPoint(x: 149, y: 96),
        CGPoint(x: 149, y: 108),
        CGPoint(x: 149, y: 120),
        CGPoint(x: 149.5, y: 132),
        CGPoint(x: 149.5, y: 144),
        CGPoint(x: 149.5, y: 156),
        CGPoint(x: 149.5, y: 168),
        CGPoint(x: 150, y: 180),
        CGPoint(x: 150, y: 192),
        CGPoint(x: 150, y: 204),
        CGPoint(x: 150.5, y: 216),
        CGPoint(x: 150.5, y: 228),
        CGPoint(x: 150.5, y: 240),
        CGPoint(x: 138, y: 235),
        CGPoint(x: 126, y: 230),
        CGPoint(x: 114, y: 225),
    ]
    
    let po3: [CGPoint] = [
        CGPoint(x: 90, y: 159),
        CGPoint(x: 85, y: 171),
        CGPoint(x: 79, y: 183),
        CGPoint(x: 72, y: 195),
        CGPoint(x: 64, y: 207),
        CGPoint(x: 61, y: 211),
    ]
    
    let po4: [CGPoint] = [
        CGPoint(x: 201, y: 155),
        CGPoint(x: 210, y: 167),
        CGPoint(x: 219, y: 179),
        CGPoint(x: 227, y: 191),
        CGPoint(x: 233, y: 203),
    ]
    
    let po5: [CGPoint] = [
        CGPoint(x: 241 - 4, y: 77),
        CGPoint(x: 236 - 4, y: 76),
        CGPoint(x: 230 - 4, y: 74),
        CGPoint(x: 224 - 4, y: 69),
        CGPoint(x: 221 - 4, y: 64),
        CGPoint(x: 220 - 4, y: 58),
        CGPoint(x: 220 - 4, y: 54),
        CGPoint(x: 222 - 4, y: 49),
        CGPoint(x: 226 - 4, y: 43),
        CGPoint(x: 231 - 4, y: 39),
        CGPoint(x: 240 - 4, y: 35),
        CGPoint(x: 245 - 4, y: 35.5),
        CGPoint(x: 249 - 4, y: 37),
        CGPoint(x: 254 - 4, y: 41),
        CGPoint(x: 259 - 4, y: 47),
        CGPoint(x: 261 - 4, y: 53),
        CGPoint(x: 261 - 4, y: 58),
        CGPoint(x: 260 - 4, y: 63),
        CGPoint(x: 258 - 4, y: 68),
        CGPoint(x: 254 - 4, y: 73),
        CGPoint(x: 248 - 4, y: 76),
        CGPoint(x: 241 - 4, y: 77),
    ]
}
