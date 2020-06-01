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

// Functions to write color to CoreData
extension Color {
    static func getColor(data: Data) -> Color {
        do {
            return try Color(NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)!)
        } catch {
            print(error)
        }
        
        return Color.clear
    }
    
    func encode() -> Data? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
            return data
        } catch {
            return nil
        }
    }
}

// Get UIColor form Color
extension Color {

    func uiColor() -> UIColor {

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
