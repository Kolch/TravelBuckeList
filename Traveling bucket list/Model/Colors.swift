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
