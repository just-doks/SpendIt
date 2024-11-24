//
//  PlusViewNEW.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 08/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct PlusViewNEW: View {
    @Binding var isPressed: Bool
    @Binding var array: [AllInOne]
    @Binding var average: Float
    @Binding var total: Float
    
    @State var isActivate = false
    @State var description: String = ""
    @State var date = Date(timeIntervalSinceNow: 0)
    @State var money: Float = 0
    
    var body: some View {
      ZStack(alignment: .bottom) {
        ScrollView {
          VStack {
            VStack {
                HStack {
                    TextField("Description", text: self.$description).font(.title)
                    Spacer()
                }
            } .padding(.top, 60)
            Divider()
            if (self.money >= 100_000) {
                Button(action: { self.isActivate.toggle()}) {
                    Text(String(self.money))
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                }
            } else {
                Button(action: { self.isActivate.toggle()}) {
                    Text(String(self.money))
                        .font(.title)
                        .bold()
                }
            }
            Divider()
            if (isActivate) {
                VStack
                    {
                        Numpad(number: self.$money)
                        Divider()
                }
            }
            
            HStack {
                Text(makeString(from: self.date, as: .date))
                    .font(.title)
                Text(makeString(from: self.date, as: .time))
                    .font(.title)
            }
            
            //DatePicker(selection: $date, label: {Text("Date")})
            
         } .padding()
        }
       
         Button(action: {
                self.isPressed.toggle()
            
                print(self.array.count)
                print(self.money)
                print("'", self.description, "'")
            
                self.array.append(AllInOne(id: idAmount, value: self.array.count, money: self.money, description: self.description, date: self.date))
                idAmount += 1
            
                self.average = averageSpend(array: self.array)
                self.total = totalSpend(array: self.array)
            
                
                saveDataNEW(array: self.array)
            }) {
                ZStack {
                    Capsule()
                        .frame(width: 150, height: 40, alignment: .center)
                    Text("Добавить")
                        .foregroundColor(.white)
                        .font(.title)
                    }
            } .padding()
        
       }
    }
}
