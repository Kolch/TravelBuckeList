//
//  AppState.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 03.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RealmSwift
class AppState: Equatable {
    
    var userData = UserData()
    
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        return lhs.userData == rhs.userData
    }
}

extension AppState {
    struct UserData: Equatable {
        
        var places: PlacesList
        var realm: Realm!
        
        init(){
            realm = try! Realm()
            if let places = realm.objects(PlacesList.self).first {
                self.places = places
            } else {
                // create empty list
                let list = PlacesList()
                realm.beginWrite()
                realm.add(list)
                try! realm.commitWrite()
                self.places = list
            }
            print(places)
        }
        
        static func == (lhs: AppState.UserData, rhs: AppState.UserData) -> Bool {
            return lhs.places == rhs.places
        }
    }
}
