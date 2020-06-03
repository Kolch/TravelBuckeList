//
//  AppEnvironment.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 03.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct AppEnvironment {
    let container: DIContainer
}

extension AppEnvironment {
    static func bootstrap() -> AppEnvironment {
        let appState = AppState()
        let dbRepositories = configuredDBRepositories(appState: appState)
        let interactors = configuredInteractors(appState: appState, dbRepositories: dbRepositories)
        let diContainer = DIContainer(appState: appState, interactors: interactors)
        return AppEnvironment(container: diContainer)
    }
    
    private static func configuredDBRepositories(appState: AppState) -> DIContainer.DBRepositories {
        let placesDBRepository = RealPlacesDBRepository(moc: appState.userData.moc)
        return .init(placesRepository: placesDBRepository)
    }
    
    private static func configuredInteractors(appState: AppState,
                                              dbRepositories: DIContainer.DBRepositories) -> DIContainer.Interactors {
        let placesInteractor = RealPlacesInteractor(appState: appState, dbRepository: dbRepositories.placesRepository)
        return .init(placesInteractor: placesInteractor)
    }
}

extension DIContainer {
    struct DBRepositories {
        let placesRepository: PlacesDBRepository
    }
}
