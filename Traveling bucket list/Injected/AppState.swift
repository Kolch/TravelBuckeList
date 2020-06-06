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
    class UserData: Equatable, ObservableObject {
        
        @Published var places:[Place]
        var realm: Realm!
        
        private var placesToken: NotificationToken?
        init(){
            realm = try! Realm()
            places = Array(realm.objects(Place.self)) // Convert Realm results object to Array
            activateChannelsToken()
        }
        
        private func activateChannelsToken() {
            let realm = try! Realm()
            let places = realm.objects(Place.self)
            placesToken = places.observe { _ in
                self.places = Array(places)
            }
        }
        
        static func == (lhs: AppState.UserData, rhs: AppState.UserData) -> Bool {
            return lhs.places == rhs.places
        }
        
        deinit {
            placesToken?.invalidate()
        }
    }
}
