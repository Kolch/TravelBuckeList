//
//  InteractorsContainer.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 03.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation

extension DIContainer {
    struct Interactors {
        let placesInteractor: PlacesInteractor
        
        init(placesInteractor: PlacesInteractor) {
            self.placesInteractor = placesInteractor
        }
        
        static var stub: Self {
            .init(placesInteractor: StubPlacesInteractor())
        }
    }
}
