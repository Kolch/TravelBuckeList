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
    static var c_1 = Color(red: 0.176, green: 0.612, blue: 0.859)
    static var c_2 = Color(red: 0.608, green: 0.318, blue: 0.878)
    static var c_3 = Color(red: 0.153, green: 0.682, blue: 0.376)
    static var c_4 = Color(red: 0.949, green: 0.788, blue: 0.298)
    static var c_5 = Color(red: 0.949, green: 0.6, blue: 0.29)
    static var c_6 = Color(red: 0.922, green: 0.341, blue: 0.341)
    
    static var all    = [c_1, c_2, c_3, c_4, c_5, c_6]
    
    static var random: Color {
        return Colors.all.randomElement()!
    }
}
