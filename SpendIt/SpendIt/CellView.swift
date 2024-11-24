//
//  CellView1.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 04/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct CellView: View {
   
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
            
            // Решено отключить возможность редактирования даты
            //DatePicker(selection: $element.date, label: {Text("Date")})
            
            // Кнопка "Применить"
            Button(action: {
                self.isPressed.toggle()
                
                if (self.element.money != self.array[self.element.value].money) {
                    // изменено
                    self.total = totalSpend(total: self.total, previous: self.array[self.element.value].money, new: self.element.money)
                    self.average = averageSpend(count: self.array.count, total: self.total)
                    // Изменено
                    
                    self.array[self.element.value] = self.element
                    
                    saveData(array: self.array)
                }
                else if (self.element.description != self.array[self.element.value].description) {
                    self.array[self.element.value] = self.element
                    saveData(array: self.array)
                }
               
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

            // Кнопка "Удалить"
            Button(action: {
                
                if (self.array.count == 1) {
                    self.array = []
                    self.average = 0.0
                    self.total = 0.0
                } else {
                    //New code
                    self.total = totalSpend(total: self.total, deleted_value: self.array[self.element.value].money)
                    self.average = averageSpend(count: self.array.count - 1, total: self.total)
                    //-------
                    self.array.remove(at: self.element.value)
                    self.array = restoreValue(for: self.array, from: self.element.value)
                    
                    
                    /*
                    self.average = averageSpend(array: self.array)
                    self.total = totalSpend(array: self.array)
                     */
                }
                saveData(array: self.array)
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
