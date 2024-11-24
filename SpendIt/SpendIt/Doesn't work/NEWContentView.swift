//
//  NEWContentView.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 14/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct NEWContentView: View {
    
    @State var average: Float
    @State var total: Float
    @State var array: [AllInOne]
    var body: some View {
        ZStack {
            
            VStack { // 1
                // Главный список
                List(0..<array.count) { i in
                        // Элементы списка
                    ListCell(element: self.array[self.array.count - 1 - i], array: self.$array, average: self.$average, total: self.$total)
                }
            } .padding(.top, 83)
            
            //Поле статистики
            VStack{ // 2
                HStack {
                    Spacer()
                    // 2.1
                    InfoWindow(first_color: .yellow, last_color: .orange, text: "all: ", value: $total)
                    
                    Spacer()
                    // 2.2
                    InfoWindow(first_color: .pink, last_color: .purple, text: "avg: ", value: $average)
                    
                    Spacer()
                }.padding([.top, .bottom], 10)
                Divider()
                Spacer()
            }
            
            //Кнопка создания нового элемента списка
            VStack { // 3
                Spacer()
                HStack{
                    PlusButton(array: self.$array, average: self.$average, total: self.$total)
                    Spacer()
                } .padding(.leading, 30)
            }
        }
    }
}
