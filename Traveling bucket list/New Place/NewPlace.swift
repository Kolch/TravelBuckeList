//
//  NewPlace.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct NewPlace: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showColors: Bool = false
    @State var color: Color = Colors.random
    @State var didChangeColor: Bool = false
    
    var transition: AnyTransition {
        return AnyTransition.scale.combined(with: .opacity)
    }
    
    var body: some View {
        ZStack {
            VStack {
                HeaderView(color: self.$color)
                FormView(showColor: $showColors, color: self.$color)
            }
            if showColors {
                PickColor(shouldChangeColor: $showColors, color: $color)
                    .gesture(
                        TapGesture().onEnded{ _ in
                            withAnimation {
                                self.showColors.toggle()
                            }
                        }
                )
                    .transition(transition)
            }
        }
    }
}

struct NewPlace_Previews: PreviewProvider {
    static var previews: some View {
        NewPlace()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
