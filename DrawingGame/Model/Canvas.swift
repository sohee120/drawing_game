//
//  Canvas.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/23.
//

import Foundation

final class Canvas {
    @Published private(set) var elements: [UUID: any Drawable] = [:]
    
    func update(_ drawable: some Drawable) {
        elements[drawable.id] = drawable
    }
    
    func updatePathPoint(id: UUID, point: Point) {
        var drawable = elements[id] as? (any MutatingDrawable)
        drawable?.add(point)
        elements[id] = drawable
    }
    
    func drawable(point: Point) -> (any Drawable)? {
        elements.values.first { $0.contains(point: point) }
    }
    
}
