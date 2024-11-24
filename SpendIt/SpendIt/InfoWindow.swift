//
//  InfoWindow.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 13/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct InfoWindow: View {
    var first_color: Color
    var last_color: Color
    var text: String
    @Binding var value: Float
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0.0)
                .background(LinearGradient(gradient: Gradient(colors: [first_color, last_color]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(30)
            Text(text + String(value) + "₽")
                .font(.headline)
                .bold()
        }.frame(width: 170, height: 55)
    }
}
/*
struct InfoWindow_Previews: PreviewProvider {
    static var previews: some View {
        InfoWindow(first_color: .yellow, last_color: .orange, text: Binding<String>.constant(""))
    }
} */
