//
//  PlacesInteractor.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 03.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import CoreData
import SwiftUI

protocol  PlacesInteractor {
    func removePlace(_ place: Place)
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle)
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor)
    func loadPlaces()
}

struct RealPlacesInteractor: PlacesInteractor {
    
    var appState: AppState
    let dbRepository: PlacesDBRepository
    
    init(appState: AppState, dbRepository: PlacesDBRepository) {
        self.appState = appState
        self.dbRepository = dbRepository
    }
    
    func removePlace(_ place: Place) {
        dbRepository.deletePlace(place)
    }
    
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor){
        let place = Place()
        place.id = UUID().uuidString
        place.title = title
        place.info = info
       // place.color = color
        dbRepository.addPlace(place)
    }
    
    func loadPlaces(){
        let places = dbRepository.loadPlaces()
        appState.userData.places = places
    }
}

struct StubPlacesInteractor: PlacesInteractor {
    func loadPlaces(){}
    func removePlace(_ place: Place){}
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle){}
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor){}
}
