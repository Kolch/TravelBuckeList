//
//  NewPlace.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct NewPlace: View {
    let headerView = HeaderView()
    @State private var showColors: Bool = false
    
    var transition: AnyTransition {
        return AnyTransition.scale.combined(with: .opacity)
    }
    
    var body: some View {
        ZStack {
            VStack {
                headerView
                FormView(showColor: $showColors, color: headerView.color)
            }
            if showColors {
                PickColor(shouldChangeColor: $showColors)
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


struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
