//
//  PickColor.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 01.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct PickColor: View {
    @Binding var shouldChangeColor: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Button(action: {
                    withAnimation {
                        self.shouldChangeColor.toggle()
                    }
                }) {
                    Circle().frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(Color.yellow)
                }
                
                Button(action: {
                    withAnimation {
                        self.shouldChangeColor.toggle()
                    }
                }){
                    Circle().frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(Color.green)
                }
                
                Button(action: {
                    withAnimation {
                        self.shouldChangeColor.toggle()
                    }
                }){
                    Circle().frame(width: 100, height: 100, alignment: .center)
                        .foregroundColor(Color.blue)
                }
                Spacer()
            }
            Spacer()
        }
        .background(Color.white)
    }
}

//struct PickColor_Previews: PreviewProvider {
//    static var previews: some View {
//        PickColor(shouldChangeColor: )
//    }
//}
