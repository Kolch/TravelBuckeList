//
//  NewPlace.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import CoreData

struct NewPlace: View {
    
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isPickingColor: Bool = false
    @State var color: Color = Colors.random
    @State private var title = ""
    @State private var descripton = ""
    
    var transition: AnyTransition {
        return AnyTransition.scale.combined(with: .opacity)
    }
    
    var body: some View {
        ZStack {
            VStack {
                ReusablePlaceView(isPickingColor: $isPickingColor, color: $color, title: $title, descripton: $descripton, buttonAction: {
                    self.addPlace()
                }, headerTitle: "New place to see")
            }
            if isPickingColor {
                PickColor(shouldChangeColor: $isPickingColor, color: $color)
                    .gesture(
                        TapGesture().onEnded{ _ in
                            withAnimation {
                                self.isPickingColor.toggle()
                            }
                        }
                )
                    .transition(transition)
            }
        }
    }
}


// MARK: - Functions
extension NewPlace {
    func addPlace(){
        let id = UUID()
        injected.interactors.placesInteractor.addNewPlace(
            id: id,
            title: title,
            info: descripton,
            color: color.uiColor()
        )
    }
}

struct NewPlace_Previews: PreviewProvider {
    static var previews: some View {
        NewPlace()
    }
}
