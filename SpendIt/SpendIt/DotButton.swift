//
//  SpecButton.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 01/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct DotButton: View {
    @Binding var isPressed: Bool
    var body: some View {
        Button(action: {
            self.isPressed.toggle()
        }) {
                ZStack{
                    Circle()
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundColor((isPressed) ? .yellow : .gray).opacity(0.7)
                    Text(".").font(.largeTitle)
                }
            }.padding(.all, 10)
        }
    }

/*
struct SpecButton_Previews: PreviewProvider {
    static var previews: some View {
        DotButton()
    }
} */
