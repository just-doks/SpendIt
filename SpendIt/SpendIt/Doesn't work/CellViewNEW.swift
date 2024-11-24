//
//  CellViewNEW.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 08/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct CellViewNEW: View {
   
    @State var isActivate = false
    
    @State var element: AllInOne
    @Binding var isPressed: Bool
    
    @Binding var array: [AllInOne]
    
    @State var word: String
    @State var money: Float
    
    @Binding var average: Float
    @Binding var total: Float

    var body: some View {
      ScrollView {
        VStack {
            VStack {
                HStack {
                    TextField("Description", text: $word).font(.title)
                    Spacer()
                }
            } .padding(.top, 60)
            Divider()
            if (money >= 100_000) {
                Button(action: { self.isActivate.toggle()}) {
                    Text(String(money))
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                }
            } else {
                Button(action: { self.isActivate.toggle()}) {
                    Text(String(money))
                        .font(.title)
                        .bold()
                }
            }
            Divider()
            if (isActivate) {
                VStack
                    {
                        Numpad(number: $money)
                        Divider()
                }
            }
            
            HStack {
                Text(makeString(from: self.element.date, as: .date))
                    .font(.title)
                Text(makeString(from: self.element.date, as: .time))
                    .font(.title)
            }
            
            //DatePicker(selection: $element.date, label: {Text("Date")})
            
            Button(action: {
                self.isPressed.toggle()
                
                self.element.description = self.word
                self.element.money = self.money
                
                self.array[self.element.value] = self.element
                
                self.average = averageSpend(array: self.array)
                self.total = totalSpend(array: self.array)
                
                //saveDataNEW(array: self.array)
            }) {
                ZStack {
                    Capsule()
                        .foregroundColor(.gray).opacity(0.4)
                        .frame(width: 150, height: 40, alignment: .center)
                    Text("Применить")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        
                    }
                    
            } .padding(.top, 30)

            Button(action: {
                
                if (self.array.count == 1) {
                    //print("del1")
                    self.array = []
                    self.average = 0.0
                    self.total = 0.0
                } else {
                    //print("del2")
                    self.array.remove(at: self.element.value)
                    self.array = restoreValue(for: self.array)
                    
                    self.average = averageSpend(array: self.array)
                    self.total = totalSpend(array: self.array)
                }
                saveDataNEW(array: self.array)
                self.isPressed.toggle()
            }) {
                ZStack {
                    Capsule()
                        .foregroundColor(.red)
                        .frame(width: 150, height: 40, alignment: .center)
                    Text("Удалить")
                        .foregroundColor(.white)
                        .font(.title)
                    }
                } .padding(10)
            
            }.padding()
        }
    }
}

