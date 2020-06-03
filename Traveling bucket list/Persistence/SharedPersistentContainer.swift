//
//  SharedPersistentContainer.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 02.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import CoreData

class SharedPersistentContainer: NSPersistentContainer {

    override open class func defaultDirectoryURL() -> URL {
        var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.Traveling-bucket-list")
        storeURL = storeURL?.appendingPathComponent("TravelBucketList.sqlite")
        return storeURL!
    }
}
