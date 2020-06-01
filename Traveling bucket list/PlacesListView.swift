//
//  ContentView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import UIKit
import SideMenu

struct PlacesListView: View {
    
   // @Environment(\.sideMenuLeftPanelKey) var sideMenuLeftPanel
    @State private var showModal: Bool = false
    @State private var navigationButtonID = UUID()
    @State private var menuButtonID = UUID()
    @State var isDrawerOpen: Bool = false
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(placeData){ place in
                        PlaceRow(place: place)
                    }
                    .onDelete(perform: { _ in
                        // delete
                    })
                }
                .disabled(isDrawerOpen)
                
                Group {
                    if self.isDrawerOpen {
                        MenuView()
                            .position(x: 170, y: 280)
                            .transition(.slide)
                            .padding()
                    }
                }
            }
            .navigationBarTitle(Text(self.isDrawerOpen ? "" : "Must see"),
                                displayMode: .large)
                .navigationBarItems(
                    leading:
                    Button(action: {
                        withAnimation {
                            self.isDrawerOpen.toggle()
                        }
                    }) {
                        if !isDrawerOpen {
                            Image("menu")
                        }
                    },
                    trailing: Button(action: {
                        self.showModal.toggle()
                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                        generator.impactOccurred()
                    }) {
                        Image("plus")
                    }
                    .id(self.navigationButtonID)
                    .sheet(isPresented: self.$showModal){
                        NewPlace().onDisappear {
                            self.navigationButtonID = UUID()
                        }
                    }
            )
                .foregroundColor(.black)
        }
        .onTapGesture {
            if self.isDrawerOpen {
                withAnimation {
                    self.isDrawerOpen.toggle()
                }
            }
        }
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView()
    }
}
