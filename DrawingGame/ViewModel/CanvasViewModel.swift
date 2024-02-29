//
//  CanvasViewModel.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/23.
//

import UIKit
import SwiftUI
import Combine

final class CanvasViewModel: ObservableObject {
    
    @Published var pathColor: Color
    private var drawingUUID: UUID?
    
    init(pathColor: Color, drawingUUID: UUID? = nil) {
        self.pathColor = pathColor
        self.drawingUUID = drawingUUID
    }

    
    lazy var elements: AnyPublisher<[any Drawable], Never> = {
        canvas.$elements
            .map { elements in
                Array(elements.values)
            }
            .eraseToAnyPublisher()
    }()
    
    private var canvas = Canvas()
    
    func didDrawBegan() {
        let drawingUUID = UUID()
        canvas.update(Path(id: drawingUUID, points: [], foregroundColor: pathColor))
        self.drawingUUID = drawingUUID
        
    }
    
    func didDraw(point: CGPoint) {
        guard let drawingUUID else { return }
        canvas.updatePathPoint(id: drawingUUID, point: Point(cgPoint: point))
    }
}
