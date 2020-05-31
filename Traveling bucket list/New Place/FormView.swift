//
//  FormView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        AnyTransition.slide
    }
}

struct FormView: View {
    @State private var descripton = ""
    @State private var showColor = false
    @State var color: Color
    //@State var pickColor = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .fontWeight(.medium)
            TextField("Add some notes if you want...", text: $descripton)
            Divider()
            Button(action: {
                self.showColor.toggle()
            }){
                HStack {
                    Text("Color")
                    Spacer()
                    Ellipse()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(color)
                }
            }
            .foregroundColor(.black)
            Divider()
            Spacer()
            
//            if showColor {
//                PickColor()
//                    .transition(.moveAndFade)
//            }
        }.padding()
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(color: Color.yellow)
            .previewLayout(.fixed(width: 400, height: 500))
    }
}
