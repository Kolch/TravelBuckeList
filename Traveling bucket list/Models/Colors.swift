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
    static var c_7 = UIColor(red: 200/255, green: 236/255, blue: 91/255, alpha: 1)
    static var c_8 = UIColor(red: 245/255, green: 190/255, blue: 205/255, alpha: 1)
    static var c_9 = UIColor(red: 124/255, green: 200/255, blue: 232/255, alpha: 1)
    static var all = [c_1, c_2, c_3, c_4, c_5, c_6, c_7, c_8, c_9]
    
    static var random: Color {
        return Color.init(Colors.all.randomElement()!)
    }
}

// MARK: UIColor form Color
extension Color {
    func uiColor() -> UIColor {
        let hex = self.description
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

// MARK: from hex
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
    
    // MARK: To hex
    enum HexFormat {
        case RGB
        case ARGB
        case RGBA
        case RRGGBB
        case AARRGGBB
        case RRGGBBAA
    }

    enum HexDigits {
        case d3, d4, d6, d8
    }

    func hexString(_ format: HexFormat = .RRGGBBAA) -> String {
        let maxi = [.RGB, .ARGB, .RGBA].contains(format) ? 16 : 256

        func toI(_ f: CGFloat) -> Int {
            return min(maxi - 1, Int(CGFloat(maxi) * f))
        }

        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        self.getRed(&r, green: &g, blue: &b, alpha: &a)

        let ri = toI(r)
        let gi = toI(g)
        let bi = toI(b)
        let ai = toI(a)

        switch format {
        case .RGB:       return String(format: "#%X%X%X", ri, gi, bi)
        case .ARGB:      return String(format: "#%X%X%X%X", ai, ri, gi, bi)
        case .RGBA:      return String(format: "#%X%X%X%X", ri, gi, bi, ai)
        case .RRGGBB:    return String(format: "#%02X%02X%02X", ri, gi, bi)
        case .AARRGGBB:  return String(format: "#%02X%02X%02X%02X", ai, ri, gi, bi)
        case .RRGGBBAA:  return String(format: "#%02X%02X%02X%02X", ri, gi, bi, ai)
        }
    }

    func hexString(_ digits: HexDigits) -> String {
        switch digits {
        case .d3: return hexString(.RGB)
        case .d4: return hexString(.RGBA)
        case .d6: return hexString(.RRGGBB)
        case .d8: return hexString(.RRGGBBAA)
        }
    }
}
