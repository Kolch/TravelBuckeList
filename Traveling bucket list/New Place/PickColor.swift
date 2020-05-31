//
//  PickColor.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 01.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct PickColor: View {
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 30) {
                Spacer()
                Circle().frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(Color.yellow)
                Circle().frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(Color.green)
                Circle().frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(Color.blue)
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct PickColor_Previews: PreviewProvider {
    static var previews: some View {
        PickColor()
    }
}
