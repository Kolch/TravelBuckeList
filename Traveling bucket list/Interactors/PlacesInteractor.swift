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
    func removePlace(at offsets: IndexSet)
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle)
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor)
}

struct RealPlacesInteractor: PlacesInteractor {
    
    var appState: AppState
    let dbRepository: PlacesDBRepository
    
    init(appState: AppState, dbRepository: PlacesDBRepository) {
        self.appState = appState
        self.dbRepository = dbRepository
    }
    
    func removePlace(at offsets: IndexSet) {
        for index in offsets {
            let place = appState.userData.places[index]
            dbRepository.deletePlace(place)
        }
    }
    
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor){
        dbRepository.addPlace(id: id, title: title, info: info, color: color)
    }
}

struct StubPlacesInteractor: PlacesInteractor {
    func removePlace(at offsets: IndexSet){}
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle){}
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor){}
}
