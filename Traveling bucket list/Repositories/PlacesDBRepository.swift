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
import RealmSwift

protocol PlacesDBRepository {
    func addPlace(_ place: Place)
    func deletePlace(_ place: Place)
    func loadPlaces() -> [Place]
}

struct RealPlacesDBRepository: PlacesDBRepository {
    
    var realm: Realm
    
    init(realm: Realm){
        self.realm = realm
    }
    
    func addPlace(_ place: Place){
        print("add place")
        try? realm.write {
            realm.add(place)
        }
    }
    
    func deletePlace(_ place: Place){
        DispatchQueue.main.async {
            try! self.realm.write {
                self.realm.delete(place)
            }
        }
    }
    
    func loadPlaces() -> [Place] {
        print("get places")
        let places = realm.objects(Place.self)
        return Array(places)
    }
}

struct StubPlacesDBRepository: PlacesDBRepository {
    func addPlace(_ place: Place) {}
    func deletePlace(_ place: Place){}
    func loadPlaces() -> [Place] { return [] }
}
