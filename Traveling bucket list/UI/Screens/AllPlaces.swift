//
//  ContentView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import UIKit
import Combine
import RealmSwift
import Introspect

struct AllPlaces: View {
    @Environment(\.injected) private var injected: DIContainer
    @State private var shouldReload: Bool = false
    @State private var showModal: Bool    = false
    @State private var navigationButtonID = UUID()
    @State private var showDetail: Bool   = false
    @State private var placeToPass: Place = Place()
    @State private var isMenuOpen: Bool   = false
    
    init(){
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        self.isMenuOpen.toggle()
                    }){
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                    Spacer()
                    Text("Must see").font(.title)
                    Spacer()
                    Button(action: {
                        self.showModal.toggle()
                        self.injected.interactors.placesInteractor
                            .generatFeedbackWith(style: .heavy)
                    }){
                        Image("plus")
                    }
                    .id(self.navigationButtonID)
                    .sheet(isPresented: self.$showModal){
                        NewPlace().environment(\.injected, self.injected).onDisappear {
                            self.navigationButtonID = UUID()
                        }
                    }
                }
                .padding()
                .foregroundColor(.black)
                List {
                    ForEach(injected.appState.userData.placesList.list.keyedEnumeration){ key in
                        PlaceRow(place: self.injected.appState.userData.placesList.list[key]!)
                            .onTapGesture {
                                self.showDetail.toggle()
                                self.placeToPass = self.injected.appState.userData.placesList.list[key]!
                                
                        }
                        .sheet(isPresented: self.$showDetail) {
                            PlaceDetail(place: self.placeToPass).environment(\.injected, self.injected)
                        }
                    }
                    .onDelete { index in
                        withAnimation(.easeInOut) {
                            self.injected.interactors.placesInteractor.removePlace(at: index)
                            self.navigationButtonID = UUID() // TODO: need to find a way to remove this
                        }
                    }
                    
                }
                .introspectTableView { table in
                    table.isUserInteractionEnabled = !self.isMenuOpen
                }
            }
                // TODO: blocks deleting tap action
            .onTapGesture {
                if self.isMenuOpen {
                    self.isMenuOpen.toggle()
                }
            }
            
            SideMenu(isOpen: $isMenuOpen)
                .foregroundColor(.black)
        }
        .offset(x: !isMenuOpen ? 0 : UIScreen.main.bounds.width - 100)
        .animation(.default)
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        return AllPlaces()
    }
}
