//
//  HeaderView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @Binding var color: Color
    @State private var descripton = ""
    
    var body: some View {
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
                    //action
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
    }
    
    var saveButton: Color {
        return !title.isEmpty ? .black : .gray
    }
    
    var headColor: Color {
        return color
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(color: .constant(.yellow))
            .previewLayout(.fixed(width: 400, height: 500))
    }
}
