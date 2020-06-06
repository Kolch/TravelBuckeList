//
//  HeaderView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import Introspect

struct NewPlaceView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var isPickingColor: Bool
    @Binding var color: Color
    
    @State private var title = ""
    @State private var descripton = ""
    @State private var viewIsReady = false
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 40.0) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        let generator = UIImpactFeedbackGenerator(style: .soft)
                        generator.impactOccurred()
                    }) {
                        Text("Cancel")
                    }
                    Spacer()
                    Text("New place to see")
                        .font(.headline)
                        .frame(alignment: .leading)
                    Spacer()
                    Button(action: {
                        // save to core data
                        self.addPlace()
                        let generator = UINotificationFeedbackGenerator()
                        generator.notificationOccurred(.success)
                        self.presentationMode.wrappedValue.dismiss()
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
                    UIApplication.shared.endEditing()
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
        }.onDisappear {
            UIApplication.shared.endEditing()
        }
    }
    
    var saveButton: Color {
        return !title.isEmpty ? .black : .gray
    }
    
    var headColor: Color {
        return color
    }
    
    func addPlace() {
//        let place = Place(context: self.moc)
//        place.id = UUID()
//        place.title = self.title
//        place.info = self.descripton
//        place.color = self.color.uiColor()
//        try? moc.save()
    }
}

struct NewPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlaceView(isPickingColor: .constant(false), color: .constant(.blue))
            .previewLayout(.fixed(width: 400, height: 500))
    }
}
