//
//  Place.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import SwiftUI
import RealmSwift

class Place: Object, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var info = ""
    @objc dynamic var color = UIColor.blue.hexString(.d8)
    
    override static func primaryKey() -> String? {
      return "id"
    }
}

class PlacesList: Object, Identifiable {
    let list = RealmSwift.List<Place>()
}
