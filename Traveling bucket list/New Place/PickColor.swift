//
//  PickColor.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 01.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct PickColor: View {
    @Binding var shouldChangeColor: Bool
    @Binding var color: Color
    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .background(Color.white)
    }
    
    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        return VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack(alignment: .topLeading) {
                    Spacer()
                    ForEach(Colors.all, id: \.self) { color in
                        self.item(for: Color(color))
                            .padding([.horizontal, .vertical], 4)
                            .alignmentGuide(.leading, computeValue: { d in
                                if (abs(width - d.width) > g.size.width)
                                {
                                    width = 0
                                    height -= d.height
                                }
                                let result = width
                                if color == Colors.all.last! {
                                    width = 0
                                } else {
                                    width -= d.width
                                }
                                return result
                            })
                            .alignmentGuide(.top, computeValue: {d in
                                let result = height
                                if color == Colors.all.last! {
                                    height = 0
                                }
                                return result
                            })
                    }
                    Spacer()
                }
                Spacer()
            }
            Spacer()
        }
    }

    func item(for color: Color) -> some View {
        return Button(action: {
            withAnimation {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                self.shouldChangeColor.toggle()
                self.color = color
            }
        }) {
            ZStack{
                Circle().frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(color)
                if color == self.color {
                    Image("check")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct PickColor_Previews: PreviewProvider {
    static var previews: some View {
        PickColor(shouldChangeColor: .constant(false),
                  color: .constant(Color(Colors.c_1)))
    }
}
