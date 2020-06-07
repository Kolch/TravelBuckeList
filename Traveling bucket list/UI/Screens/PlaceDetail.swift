//
//  PlaceDetail.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 07.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import UIKit

struct PlaceDetail: View {
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isPickingColor: Bool = false
    @State var color: Color = Colors.random
    @State var title: String = ""
    @State var descripton: String = ""
    var place: Place
    
    
    
    var transition: AnyTransition {
        return AnyTransition.scale.combined(with: .opacity)
    }
    
    var body: some View {
            ZStack {
                VStack {
                    ReusablePlaceView(isPickingColor: $isPickingColor, color: $color, title: $title, descripton: $descripton, buttonAction: {
                        self.injected.interactors.placesInteractor.editPlace(id: self.place.id,
                                                                             color: self.color.uiColor(),
                                                                             title: self.title,
                                                                             info: self.descripton)
                    }, headerTitle: "")
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
            .onAppear {
                self.color = Color.init(UIColor.init(hex: self.place.color) ?? UIColor.lightGray)
                self.title = self.place.title
                self.descripton = self.place.info
        }
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(color: Colors.random, title: "Title", descripton: "Info", place: Place())
    }
}
