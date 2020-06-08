//
//  ReusablePlaceView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 07.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct ReusablePlaceView: View {
    
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPickingColor: Bool
    @Binding var color: Color
    @Binding var title: String
    @Binding var descripton: String
    
    typealias MethodHandler = ()  -> Void
    var buttonAction: MethodHandler
    var headerTitle: String
    
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
                    Text(headerTitle)
                        .font(.headline)
                        .frame(alignment: .leading)
                    Spacer()
                    Button(action: {
                        self.buttonAction()
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
            .padding(.all).background(color)
            
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
}

struct ReusablePlaceView_Previews: PreviewProvider {
    
    static var previews: some View {
        ReusablePlaceView(isPickingColor: .constant(false), color: .constant(.blue), title: .constant("Title"), descripton: .constant("Info"), buttonAction: {}, headerTitle: "Header Title")
    }
}
