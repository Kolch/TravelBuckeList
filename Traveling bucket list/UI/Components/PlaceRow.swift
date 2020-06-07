//
//  PlaceRow.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct PlaceRow: View {
    var place: Place
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(place.title)
                    .font(.title)
                Text(place.info)
                    .font(.subheadline)
            }
            .padding()
            Spacer()
        }
        .background(Color(UIColor(hex: place.color) ?? UIColor.lightGray))
        .cornerRadius(10)
    }
}


struct PlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlaceRow(place: Place())
            PlaceRow(place: Place())
        }
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
