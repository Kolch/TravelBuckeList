//
//  SideMenu.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 01.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

//struct NavigationDrawer: View {
//    private let width = UIScreen.main.bounds.width - 100
//    @Binding var isOpen: Bool
//
//    var body: some View {
////        HStack {
////            MenuContent()
////                .frame(width: self.width)
////                .offset(x: self.isOpen ? 0 : -self.width)
////                .animation(.easeInOut)
////            Spacer()
////        }
////        .background(Color.clear)
//    }
//}

struct NavigationDrawer_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(isOpen: .constant(true))
    }
}


struct MenuView : View {
    @State private var schemeMode: Bool = false
    @State private var changeMode: Bool = false
    @Binding var isOpen: Bool
    private let width = UIScreen.main.bounds.width - 100
    var body: some View {
//        ZStack(alignment: .topLeading) {
//            Rectangle()
//                .fill(Color.white)
//                .frame(width: 300, height: 700)
//                .cornerRadius(20)
//                .shadow(color: .gray, radius: 8)
//                .position(x: 150, y: 255)
//
//            VStack(alignment: .leading, spacing: 20) {
//                Button(action: {}) {
//                    HStack {
//                        Image(systemName: "person.circle").font(.system(size: 25))
//                            .foregroundColor(.black)
//                        Text("Profile").foregroundColor(.black)
//                    }
//                }
//
//                Button(action: {}) {
//                    HStack {
//                        Image(systemName: "person.circle").font(.system(size: 25))
//                            .foregroundColor(.black)
//                        Text("Profile").foregroundColor(.black)
//                    }
//                }
//
//                Button(action: {}) {
//                    HStack {
//                        Image(systemName: "person.circle").font(.system(size: 25))
//                            .foregroundColor(.black)
//                        Text("Profile").foregroundColor(.black)
//                    }
//                }
//            }.padding()
//
//        }
        
        HStack {
            MenuContent()
                .frame(width: self.width, height: UIScreen.main.bounds.height)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.easeInOut)
            Spacer()
        }
        .background(Color.clear)
    }
}
