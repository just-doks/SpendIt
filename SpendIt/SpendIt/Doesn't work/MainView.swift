//
//  MainView.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 08/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @State var average: Float = averageSpend(array:  BigArray)
    @State var total: Float = totalSpend(array: BigArray)
    @State var array: [AllInOne] = BigArray
    var body: some View {
        ZStack {
            
            VStack { // 1
                // Главный список
                List(reverse(array: array)) { element in
                        // Элементы списка
                    ListCellNEW(element: element, array: self.$array, average: self.$average, total: self.$total)
                }
            } .padding(.top, 83)
            
            //Поле статистики
            VStack{ // 2
                HStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .opacity(0.0)
                            .background(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(30)
                        Text("total " + String(total) + "₽")
                            .font(.headline)
                            .bold()
                    }.frame(width: 170, height: 55)
                    Spacer()
                    ZStack {
                        Rectangle()
                            .opacity(0.0)
                            .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(30)
                        Text("avg " + String(average)+"₽")
                            .foregroundColor(.white)
                            .font(.headline)
                            .bold()
                    } .frame(width: 170, height: 55)
                        
                    Spacer()
                }.padding([.top, .bottom], 10)
                Divider()
                Spacer()
            }
            
            //Кнопка создания нового элемента списка
            VStack { // 3
                Spacer()
                HStack{
                    PlusButtonNEW(array: self.$array, average: self.$average, total: self.$total)
                    Spacer()
                } .padding(.leading, 30)
            }
        }
    }
}
 
