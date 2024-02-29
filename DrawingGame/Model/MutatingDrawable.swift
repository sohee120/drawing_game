//
//  MutatingDrawable.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/23.
//

import Foundation

protocol MutatingDrawable: Drawable {
    mutating func add(_ point: Point)
}
