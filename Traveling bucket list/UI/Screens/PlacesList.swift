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

struct PlacesList: View {
    @Environment(\.injected) private var injected: DIContainer
    
    @State private var shouldReload: Bool = false
    @State private var showModal: Bool = false
    @State private var navigationButtonID = UUID()
   // @State private var places: [Place] = []
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(injected.appState.userData.places){ place in
                        PlaceRow(place: place)
                    }
                    .onDelete { index in
                        withAnimation(.easeInOut) {
                            self.deletePlace(at: index)
                        }
                    }
                }
                if injected.appState.userData.places.isEmpty {
                    Text("Empty")
                }
            }
            .navigationBarTitle("Must see")
            .navigationBarItems(
                trailing: Button(action: {
                    self.showModal.toggle()
                    self.generateFeedBack(style: .heavy)
                }) {
                    Image("plus")
                }
                .id(self.navigationButtonID)
                .sheet(isPresented: self.$showModal){
                    NewPlace().environment(\.injected, self.injected).onDisappear {
                        self.navigationButtonID = UUID()
                    }
                }
            )
                .foregroundColor(.black)
        }
        .onAppear {
        }
    }
}


private extension PlacesList {
    func deletePlace(at index: IndexSet){
        if let index = index.first {
            injected.interactors
            .placesInteractor
                .removePlace(injected.appState.userData.places[index])
        }
    }
    
    func generateFeedBack(style: UIImpactFeedbackGenerator.FeedbackStyle){
        injected.interactors.placesInteractor
            .generatFeedbackWith(style: style)
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        return PlacesList()
    }
}
