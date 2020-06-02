//
//  ShareView.swift
//  BucketListShare
//
//  Created by Kolchedantsev Alexey on 02.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import CoreData

struct ShareView: View {
    
    @Binding var isPickingColor: Bool
    @State var color: Color
    
    @State private var title = ""
    @State var descripton: String
    @State private var viewIsReady = false
    @ObservedObject var delegate: ShareActionDelegate
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 40.0) {
                HStack {
                    Button(action: {
                        // have to fix, poor logic somewhere
                        self.delegate.cancel.toggle()
                        self.delegate.cancel.toggle()
                    }) {
                        Text("Cancel")
                    }
                    Spacer()
                    Text("New place to see")
                        .font(.headline)
                        .frame(alignment: .leading)
                    Spacer()
                    Button(action: {
                        // have to fix, poor logic somewhere
                        self.delegate.send.toggle()
                        self.delegate.send.toggle()
                        
                        // save to core data
                        self.saveData()
                    }) {
                        Text("Save")
                            .foregroundColor(saveButton)
                    }.disabled(title.isEmpty)
                        .padding()
                }
                .foregroundColor(Color.black)
                VStack(alignment: .leading) {
                    Text("Title")
                        .fontWeight(.medium)
                    TextField("Type the place you must see", text: $title)
                        .font(.headline)
                }
            }
            .padding(.all).background(headColor)
            
            VStack(alignment: .leading) {
                Text("Description")
                    .fontWeight(.medium)
                TextField("Add some notes if you want...", text: $descripton)
                Divider()
                Button(action: {
                    withAnimation {
                        self.isPickingColor.toggle()
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
    
    var saveButton: Color {
        return !title.isEmpty ? .black : .gray
    }
    
    var headColor: Color {
        return color
    }
    
    func saveData(){
        let moc = persistentContainer.viewContext
        let place = Place(context: moc)
        place.id = UUID()
        place.title = self.title
        place.info = self.descripton
        place.color = self.color.uiColor()
        try? moc.save()
    }
    
    // MARK: -  Core Data
    var persistentContainer: NSPersistentContainer = {
        let container = SharedPersistentContainer(name: "TravelBucketList")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    mutating func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
