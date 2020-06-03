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
    func addPlace(id: UUID, title: String, info: String, color: UIColor)
}

struct RealPlacesInteractor: PlacesInteractor {
    var moc: NSManagedObjectContext
    var appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
        moc = appState.userData.context
    }
    
    func removePlace(at offsets: IndexSet) {
        for index in offsets {
            let place = appState.userData.places[index]
            moc.delete(place)
        }
    }
    
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func addPlace(id: UUID, title: String, info: String, color: UIColor){
        print("ADD PLACE")
        let place = Place(context: self.moc)
        place.id    = UUID()
        place.title = title
        place.info  = info
        place.color =  color
        try? moc.save()
    }
}

struct StubPlacesInteractor: PlacesInteractor {
    func removePlace(at offsets: IndexSet){}
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle){}
    func addPlace(id: UUID, title: String, info: String, color: UIColor){}
}
