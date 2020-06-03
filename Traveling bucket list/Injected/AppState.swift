//
//  AppState.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 03.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class AppState: ObservableObject {
    var userData = UserData()
}

extension AppState {
    class UserData: ObservableObject {
        var moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //@FetchRequest(entity: Place.entity(), sortDescriptors: []) var places: FetchedResults<Place>
        
        var places:[Place] {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
            do {
                let results = try moc.fetch(fetchRequest)
                let  places = results as! [Place]
                return places
            } catch {
                NSLog("Error on fetching core data")
                return []
            }
        }
    }
}
