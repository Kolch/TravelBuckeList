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
    @Binding var showColor: Bool
    @State var color: Color
    
    var transition: AnyTransition {
        return AnyTransition.scale.combined(with: .opacity)
    }
    
    var body: some View {
      //  ZStack {
            VStack(alignment: .leading) {
                Text("Description")
                    .fontWeight(.medium)
                TextField("Add some notes if you want...", text: $descripton)
                Divider()
                Button(action: {
                    withAnimation {
                        self.showColor.toggle()
                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                        generator.impactOccurred()
                    }
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
            }.padding()
    }
}
//
//struct FormView_Previews: PreviewProvider {
//    static var previews: some View {
//        FormView(showColor: <#Binding<Bool>#>, color: Color.yellow)
//            .previewLayout(.fixed(width: 400, height: 500))
//    }
//}
