//
//  PlacesDBRepository.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 03.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import CoreData
import UIKit

protocol PlacesDBRepository {
    func addPlace(id: UUID, title: String, info: String, color: UIColor)
    func deletePlace(_ place: Place)
    func loadPlaces() -> [Place]
}

struct RealPlacesDBRepository: PlacesDBRepository {
    
    let moc: NSManagedObjectContext

    func addPlace(id: UUID, title: String, info: String, color: UIColor){
        let place = Place(context: moc)
        place.id = id
        place.title = title
        place.color = color
        place.info = info
        try? moc.save()
    }
    
    func deletePlace(_ place: Place){
        moc.delete(place)
        try? moc.save()
    }
    
    func loadPlaces() -> [Place] {
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

struct StubPlacesDBRepository: PlacesDBRepository {
    func addPlace(id: UUID, title: String, info: String, color: UIColor) {}
    func deletePlace(_ place: Place){}
    func loadPlaces() -> [Place] { return [] }
}
