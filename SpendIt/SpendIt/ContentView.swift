//
//  ContentView.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 29/07/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var average: Float
    @State var total: Float
    @State var array: [AllInOne]
    var body: some View {
        ZStack {
            
            VStack { // 1
                // Главный список
                List(reverse(array: array)) { element in
                        // Элементы списка
                    ListCell(element: element, array: self.$array, average: self.$average, total: self.$total)
                }
            } .padding(.top, 83)
            
            //Поле статистики
            VStack{ // 2
                HStack {
                    Spacer()
                    InfoWindow(first_color: .yellow, last_color: .orange, text: "all: ", value: $total)
                    
                    Spacer()
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

 
 
/*
 struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} */

