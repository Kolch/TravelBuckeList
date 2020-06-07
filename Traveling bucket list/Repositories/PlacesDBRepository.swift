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
    func deletePlace(with id: String)
    func loadPlaces() -> Results<Place>
}

struct RealPlacesDBRepository: PlacesDBRepository {
    
    var realm: Realm
    
    init(realm: Realm){
        self.realm = realm
    }
    
    func addPlace(_ place: Place){
        try? realm.write {
            realm.add(place)
        }
    }
    
    func deletePlace(with id: String){
        if let objectToDelete = realm.object(ofType: Place.self, forPrimaryKey: id), !objectToDelete.isInvalidated {
            try? realm.write {
                objectToDelete.title = "__"
            }
        }
    }
    
    func loadPlaces() -> Results<Place> {
        let places = realm.objects(Place.self)
        return places
    }
}

struct StubPlacesDBRepository: PlacesDBRepository {
    func addPlace(_ place: Place) {}
    func deletePlace(with id: String){}
    func loadPlaces() -> Results<Place> {
        let realm = try! Realm()
        return realm.objects(Place.self)
    }
}
