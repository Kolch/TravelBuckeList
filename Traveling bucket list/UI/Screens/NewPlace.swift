//
//  NewPlace.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import CoreData

struct NewPlace: View {
    
    @Environment(\.injected) private var injected: DIContainer
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isPickingColor: Bool = false
    @State var color: Color = Colors.random
    @State var didChangeColor: Bool = false
    @State private var title = ""
    @State private var descripton = ""
    @State private var viewIsReady = false
    
    var transition: AnyTransition {
        return AnyTransition.scale.combined(with: .opacity)
    }
    
    var body: some View {
        ZStack {
            VStack {
                newPlaceViewModel
            }
            if isPickingColor {
                PickColor(shouldChangeColor: $isPickingColor, color: $color)
                    .gesture(
                        TapGesture().onEnded{ _ in
                            withAnimation {
                                self.isPickingColor.toggle()
                            }
                        }
                )
                    .transition(transition)
            }
        }
    }
    
    var moc: NSManagedObjectContext {
        return injected.appState.userData.context
    }
}

private extension NewPlace {
    var newPlaceViewModel: some View {
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

// MARK: - Functions
extension NewPlace {
    func addPlace(){
        self.injected.interactors
            .placesInteractor.addPlace(
                id: UUID(),
                title: self.title,
                info: self.descripton,
                color: self.color.uiColor())
    }
}

struct NewPlace_Previews: PreviewProvider {
    static var previews: some View {
        NewPlace()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
