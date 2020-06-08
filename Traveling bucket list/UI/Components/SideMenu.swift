//
//  SideMenu.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 08.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct SideMenu: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Menu")
            }
            .padding(.top, 20)
            
            HStack {
                Spacer()
            }
            Spacer()
        }
        .padding(.vertical, 30)
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(Colors.c_5), Color.init(Colors.c_2)]), startPoint: .topLeading, endPoint: .bottom))
        .offset(x: -UIScreen.main.bounds.width)
        .animation(.default)
        .padding(.trailing, 80)
        .edgesIgnoringSafeArea(.vertical)
       // .clipped()
        .shadow(color: .black, radius: 10, x: 0, y: 0)
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(isOpen: .constant(true))
    }
}
