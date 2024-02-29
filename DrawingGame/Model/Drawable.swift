//
//  Drawing.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/18.
//

import Foundation
import SwiftUI

protocol Drawable: Identifiable {
    var id: UUID { get }
    var path: Path { get }
    var fillColor: Color? { get }
    var foregroundColor: Color? { get }
}

extension Drawable {
    func contains(point: Point) -> Bool {
        path.contains(point: point)
    }
}
