////
////  FormView.swift
////  Traveling bucket list
////
////  Created by Kolchedantsev Alexey on 31.05.2020.
////  Copyright © 2020 alex kolhc. All rights reserved.
////
//
//import SwiftUI
//
//extension AnyTransition {
//    static var moveAndFade: AnyTransition {
//        AnyTransition.slide
//    }
//}
//
//struct FormView: View {
//    @State private var descripton = ""
//    @Binding var showColor: Bool
//    @Binding var color: Color
//    
//    var categories = ["Art", "Social", "Other"]
//    @State private var selectedColor = 0
//    var transition: AnyTransition {
//        return AnyTransition.scale.combined(with: .opacity)
//    }
//    
//    var body: some View {
//            VStack(alignment: .leading) {
//                Text("Description")
//                    .fontWeight(.medium)
//                TextField("Add some notes if you want...", text: $descripton)
//                Divider()
//                Button(action: {
//                    withAnimation {
//                        self.showColor.toggle()
//                    }
//                }){
//                    HStack {
//                        Text("Color")
//                        Spacer()
//                        Ellipse()
//                            .frame(width: 25, height: 25, alignment: .center)
//                            .foregroundColor(circleColor)
//                    }
//                }
//                .foregroundColor(.black)
//                Divider()
//                Spacer()
//            }.padding()
//    }
//    
//    var circleColor: Color {
//        return color
//    }
//}
//
//struct FormView_Previews: PreviewProvider {
//    static var previews: some View {
//        FormView(showColor: .constant(true), color: .constant(.yellow))
//            .previewLayout(.fixed(width: 400, height: 500))
//    }
//}
