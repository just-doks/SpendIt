//
//  ListCellNEW.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 08/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct ListCellNEW: View {
    var element: AllInOne
    @Binding var array: [AllInOne]
    @Binding var average: Float
    @Binding var total: Float
    @State var isPressed = false
    
    var body: some View {
        // Каждый элемент - это кнопка
        
        Button(action: {
            self.isPressed.toggle()
        }) {
            // Визуальное представление кнопки / самого элемента
            
            HStack{
                VStack(alignment: .leading) {
                    Text(element.description)
                        .font(.title)
                        .bold()
                    HStack{
                        Text(makeString(from: element.date, as: .date))
                                .font(.callout)
                        Text(makeString(from: element.date, as: .time))
                                .font(.callout)
                    }
                }
                Spacer()
                Text(String(element.money)+"₽")
                    .font(.title)
            }.padding(.horizontal, 20)
               // метод sheet открывает новое окно в виде карточки
        } .sheet(isPresented: $isPressed, content: {
                    // передаём данные в доп инфо окно элмента и открываем его
            CellViewNEW(element: self.element, isPressed: self.$isPressed, array: self.$array, word: self.element.description, money: self.element.money, average: self.$average, total: self.$total)})
                    // Данные передаются ссылочным образом, происходит связывание
        }
    }

