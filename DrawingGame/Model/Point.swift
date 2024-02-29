//
//  Point.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/23.
//

import Foundation

struct Point: Equatable, CustomDebugStringConvertible {
    let x: CGFloat
    let y: CGFloat
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    init(cgPoint: CGPoint) {
        self.x = cgPoint.x
        self.y = cgPoint.y
    }
    
    var cgPoint: CGPoint {
        CGPoint(x: x, y: y)
    }
    
    var debugDescription: String {
        "(\(x), \(y))"
    }
}
