//
//  UIColor+random.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/23.
//

import UIKit

extension UIColor {
    static var random: UIColor {
        let red = Double.random(in: 0.0..<1.0)
        let green = Double.random(in: 0.0..<1.0)
        let blue = Double.random(in: 0.0..<1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
