//
//  Place.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import SwiftUI

struct Place: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var category: Category
    var isVisited: Bool = false
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case food = "Food"
        case social = "Social"
        case art = "Art"
    }
}
