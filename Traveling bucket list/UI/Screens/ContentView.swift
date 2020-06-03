//
//  ContentView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 03.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    var body: some View {
        PlacesList().inject(container)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(container: .preview)
    }
}
