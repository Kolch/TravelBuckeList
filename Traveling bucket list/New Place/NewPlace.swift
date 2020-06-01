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
    var body: some View {
            VStack {
                headerView
                FormView(color: headerView.color)
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
