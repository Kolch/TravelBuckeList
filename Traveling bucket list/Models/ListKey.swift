//
//  ListKey.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 07.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation

import RealmSwift

typealias Model = Object & Identifiable

struct ListKey<T: Model>: Identifiable {
    let id: T.ID
}

extension RealmSwift.List where Element: Model {

    subscript(key: ListKey<Element>) -> Element? {
        Element.primaryKey().flatMap { self.filter("\($0) = %@", key.id).first }
    }

    var keyedEnumeration: [ListKey<Element>] {
        guard let key = Element.primaryKey() else { return [] }
        let keys: [AnyObject] = value(forKey: key)
        return keys.enumerated().map { ListKey(id: $0.1 as! Element.ID) }
    }
}
