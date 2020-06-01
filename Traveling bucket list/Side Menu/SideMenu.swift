//
//  SideMenu.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 01.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
   let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
               self.menuClose()
            }
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)

                Spacer()
            }
        }
    }
}

//struct SideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SideMenu(width: 200, isOpen: true)
//    }
//}
