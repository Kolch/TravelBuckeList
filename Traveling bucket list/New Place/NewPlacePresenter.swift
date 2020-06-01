//
//  NewPlace.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct NewPlacePresenter: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isPickingColor: Bool = false
    @State var color: Color = Colors.random
    @State var didChangeColor: Bool = false
    @State private var didSave: Bool = false
    var transition: AnyTransition {
        return AnyTransition.scale.combined(with: .opacity)
    }
    
    var body: some View {
        ZStack {
            VStack {
                NewPlaceView(isPickingColor: $isPickingColor, color: $color).environment(\.managedObjectContext, moc)
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
            
            if didSave {
                
            }
        }
    }
}

struct NewPlace_Previews: PreviewProvider {
    static var previews: some View {
        NewPlacePresenter()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
