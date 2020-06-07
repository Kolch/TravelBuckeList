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
    func move(from source: IndexSet, to destination: Int)
    func removePlace(at offsets: IndexSet)
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle)
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor)
    func loadPlaces()
    func editPlace(id: String, color: UIColor, title: String, info: String)
}

struct RealPlacesInteractor: PlacesInteractor {
    
    var appState: AppState
    let dbRepository: PlacesDBRepository
    
    init(appState: AppState, dbRepository: PlacesDBRepository) {
        self.appState = appState
        self.dbRepository = dbRepository
    }
    
    func removePlace(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        appState.userData.realm.beginWrite()
        appState.userData.placesList.list.remove(at: index)
        try! appState.userData.realm.commitWrite()
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
        place.color = color.hexString(.d8)
        appState.userData.realm.beginWrite()
        appState.userData.placesList.list.append(place)
        try! appState.userData.realm.commitWrite()
    }
    
    func loadPlaces(){}
    
    func move(from source: IndexSet, to destination: Int) {
        appState.userData.realm.beginWrite()
        appState.userData.placesList.list.move(fromOffsets: source, toOffset: destination)
        try! appState.userData.realm.commitWrite()
    }
    
    func editPlace(id: String, color: UIColor, title: String, info: String) {
        if let placeToEdit = appState.userData.placesList.list.filter({$0.id == id}).first {
            appState.userData.realm.beginWrite()
            placeToEdit.color = color.hexString(.d8)
            placeToEdit.title = title
            placeToEdit.info = info
            try! appState.userData.realm.commitWrite()
        }
    }
}

struct StubPlacesInteractor: PlacesInteractor {
    func editPlace(id: String, color: UIColor, title: String, info: String) {}
    func move(from source: IndexSet, to destination: Int){}
    func loadPlaces(){}
    func removePlace(at offsets: IndexSet){}
    func generatFeedbackWith(style: UIImpactFeedbackGenerator.FeedbackStyle){}
    func addNewPlace(id: UUID, title: String, info: String, color: UIColor){}
}
