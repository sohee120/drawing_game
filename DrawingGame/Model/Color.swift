//
//  Color.swift
//  DrawingGame
//
//  Created by 윤소희 on 2024/01/23.
//

import Foundation
import UIKit
import SwiftUI

//struct Color: CustomDebugStringConvertible, Equatable {
//    let red: CGFloat
//    let green: CGFloat
//    let blue: CGFloat
//
//    var debugDescription: String {
//        String(
//            format: "#%02X%02X%02X",
//            Int(red * 255),
//            Int(green * 255),
//            Int(blue * 255)
//        )
//    }
//
//    static let redColor = Color(uiColor: UIColor(red: 255, green: 0, blue: 0, alpha: 1))
//    static let orangeColor = Color(uiColor: UIColor(red: 255, green: 127, blue: 26, alpha: 1))
//    static let yellowColor = Color(uiColor: UIColor(red: 255, green: 255, blue: 0, alpha: 1))
//    static let greenColor = Color(uiColor: UIColor(red: 0, green: 255, blue: 0, alpha: 1))
//    static let blueColor = Color(uiColor: UIColor(red: 0, green: 0, blue: 255, alpha: 1))
//    static let purpleColor = Color(uiColor: UIColor(red: 148, green: 0, blue: 211, alpha: 1))
//    static let pinkColor = Color(uiColor: UIColor(red: 255, green: 153, blue: 204, alpha: 1))
//    static let brownColor = Color(uiColor: UIColor(red: 139, green: 69, blue: 19, alpha: 1))
//    static let grayColor = Color(uiColor: UIColor(red: 128, green: 128, blue: 128, alpha: 1))
//    static let whiteColor = Color(uiColor: UIColor(red: 255, green: 255, blue: 255, alpha: 1))
//    static let blackColor = Color(uiColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1))
//
//}
//
//extension Color {
//    init?(uiColor: UIColor) {
//        guard let components = uiColor.cgColor.components else {
//            return nil
//        }
//        red = components[0]
//        green = components[1]
//        blue = components[2]
//    }
//
//    var uiColor: UIColor {
//        UIColor(red: red, green: green, blue: blue, alpha: 1.0)
//    }
//}

extension Color { // 사용법: Color(hex: "#439F47")
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }

    static let redColor = Color(hex: "#ff0000")
    static let orangeColor = Color(hex: "#ff7f1a")
    static let yellowColor = Color(hex: "#ffff00")
    static let greenColor = Color(hex: "#12AA02")
    static let blueColor = Color(hex: "#0000ff")
    static let purpleColor = Color(hex: "#9400d3")
    static let pinkColor = Color(hex: "#ff99cc")
    static let brownColor = Color(hex: "#8b4513")
    static let grayColor = Color(hex: "#797775")
    static let whiteColor = Color(hex: "#FFFFFF")
    static let blackColor = Color(hex: "#000000")
    
    
}
