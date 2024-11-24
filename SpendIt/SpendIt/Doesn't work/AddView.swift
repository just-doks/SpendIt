//
//  AddView.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 13/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @State var isActivate = false // self
    
    @State var element: AllInOne
    
    @Binding var isPressed: Bool
    @Binding var array: [AllInOne]
    @Binding var average: Float
    @Binding var total: Float

    var body: some View {
      ScrollView {
        VStack {
            VStack {
                HStack {
                    //TextField("Description", text: $word).font(.title)
                    TextField("Description", text: self.$element.description).font(.title)
                    Spacer()
                }
            } .padding(.top, 60)
            Divider()
            if (element.money >= 100_000) { // was money
                Button(action: { self.isActivate.toggle()}) {
                    Text(String(element.money)) // было money
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                }
            } else {
                Button(action: { self.isActivate.toggle()}) {
                    Text(String(element.money)) // was money
                        .font(.title)
                        .bold()
                }
            }
            Divider()
            // клавиши для изменения суммы
            if (isActivate) {
                VStack
                    {
                        Numpad(number: self.$element.money) // was $money
                        Divider()
                }
            }
            
            // Отображение даты, ддд/мм/гг и час/мин
            HStack {
                Text(makeString(from: self.element.date, as: .date))
                    .font(.title)
                Text(makeString(from: self.element.date, as: .time))
                    .font(.title)
            }
         } // VStack
       } // ScrollView
    } // Body
        
}
/*
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
} */
