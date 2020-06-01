//
//  ContentView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import UIKit

struct PlacesListView: View {
    
    @State private var showModal: Bool = false
    @State private var navigationButtonID = UUID()
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(placeData){ place in
                    PlaceRow(place: place)
                }
                .onDelete(perform: { _ in
                    // delete
                })
            }
            .navigationBarTitle("Must see")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showModal.toggle()
                    let generator = UIImpactFeedbackGenerator(style: .heavy)
                    generator.impactOccurred()
                }) {
                    Image("plus")
                }
                .foregroundColor(.black)
                .id(self.navigationButtonID)
                .sheet(isPresented: self.$showModal){
                    NewPlace().onDisappear {
                        self.navigationButtonID = UUID()
                    }
                })
        }
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView()
    }
}
