//
//  Colors.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import SwiftUI

struct Colors: Codable, Hashable {
    static var c_1 = UIColor(red: 0.176, green: 0.612, blue: 0.859, alpha: 1)
    static var c_2 = UIColor(red: 0.608, green: 0.318, blue: 0.878, alpha: 1)
    static var c_3 = UIColor(red: 0.153, green: 0.682, blue: 0.376, alpha: 1)
    static var c_4 = UIColor(red: 0.949, green: 0.788, blue: 0.298, alpha: 1)
    static var c_5 = UIColor(red: 0.949, green: 0.6, blue: 0.29, alpha: 1)
    static var c_6 = UIColor(red: 0.922, green: 0.341, blue: 0.341, alpha: 1)
    
    static var all    = [c_1, c_2, c_3, c_4, c_5, c_6]
    
    static var random: Color {
        return Color.init(Colors.all.randomElement()!)
    }
}

// Get UIColor form Color
extension Color {
    func uiColor() -> UIColor {
        let hex = self.description
        print(hex)
        var splited = hex.split(separator: " ")
        splited.remove(at: 0)
        guard splited.count == 4 else { return UIColor.lightGray }
        let r = (splited[0] as NSString).floatValue
        let g = (splited[1] as NSString).floatValue
        let b = (splited[2] as NSString).floatValue
        let a = (splited[3] as NSString).floatValue
        
        return UIColor(red: CGFloat(r), green: CGFloat(g),
                       blue: CGFloat(b), alpha: CGFloat(a))
    }
}

//extension UIColor {
//
//    // MARK: - Initialization
//
//    convenience init?(hex: String) {
//        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
//        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
//
//        var rgb: UInt32 = 0
//
//        var r: CGFloat = 0.0
//        var g: CGFloat = 0.0
//        var b: CGFloat = 0.0
//        var a: CGFloat = 1.0
//
//        let length = hexSanitized.characters.count
//
//        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }
//
//        if length == 6 {
//            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
//            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
//            b = CGFloat(rgb & 0x0000FF) / 255.0
//
//        } else if length == 8 {
//            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
//            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
//            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
//            a = CGFloat(rgb & 0x000000FF) / 255.0
//
//        } else {
//            return nil
//        }
//
//        self.init(red: r, green: g, blue: b, alpha: a)
//    }
//
//    // MARK: - Computed Properties
//
//    var toHex: String? {
//        return toHex()
//    }
//
//    // MARK: - From UIColor to String
//
//    func toHex(alpha: Bool = false) -> String? {
//        guard let components = cgColor.components, components.count >= 3 else {
//            return nil
//        }
//
//        let r = Float(components[0])
//        let g = Float(components[1])
//        let b = Float(components[2])
//        var a = Float(1.0)
//
//        if components.count >= 4 {
//            a = Float(components[3])
//        }
//
//        if alpha {
//            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
//        } else {
//            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
//        }
//    }
//
//}
