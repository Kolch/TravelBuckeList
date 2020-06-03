////
////  DependencyInjector.swift
////  Traveling bucket list
////
////  Created by Kolchedantsev Alexey on 03.06.2020.
////  Copyright © 2020 alex kolhc. All rights reserved.
////

import Foundation
import SwiftUI

// MARK: - DIContainer

struct DIContainer: EnvironmentKey {

    var appState: AppState
    let interactors: Interactors

    init(appState: AppState, interactors: Interactors) {
        self.appState = appState
        self.interactors = interactors
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(appState: AppState(), interactors: .stub)
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

#if DEBUG
extension DIContainer {
    static var preview: Self {
        .init(appState: AppState(), interactors: .stub)
    }
}
#endif


// MARK: - Injection in the view hierarchy

extension View {

    func inject(_ appState: AppState,
                _ interactors: DIContainer.Interactors) -> some View {
        let container = DIContainer(appState: appState,
                                    interactors: interactors)
        return inject(container)
    }

    func inject(_ container: DIContainer) -> some View {
        return self
            .environment(\.injected, container)
    }
}
