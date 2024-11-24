//
//  MainView.swift
//  SpendIt
//
//  Created by Дмитрий Докукин on 04/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI
/*
var BigArray: [AllInOne] = []

struct myList: View {
    @State var array: [AllInOne]
    @State var average: Float
    @State var total: Float
    var body: some View {
        List(reverse(array: array)) { element in
            // Элементы списка
        ListCell_Old(element: element, array: self.$array, average: self.$average, total: self.$total)
            
    }
}
}
struct MainView: View {
    @State var average: Float = averageSpend(array:  transit(id: Id, money: Money, description: Description, date: date))
    @State var total: Float = totalSpend(array: transit(id: Id, money: Money, description: Description, date: date))
    @State var array: [AllInOne] = BigArray
    //@State var list: View = myList(array: BigArray, average: <#Float#>, total: <#Float#>)
    var body: some View {
        ZStack {
            
            VStack { // 1
                // Главный список
                //self.list()
                
                List(reverse(array: array)) { element in
                        // Элементы списка
                    HStack{
                        ListCell_Old(element: element, array: self.$array, average: self.$average, total: self.$total)
                            .frame(width: 200, height: 40, alignment: .leading)
                        Button(action: {BigArray.remove(at: element.id)
                            BigArray = restoreID(eArray: BigArray)
                            self.array = BigArray
                            }, label: {Text("del")}).padding().background(Color.gray).cornerRadius(20)
                    }
                        
                    
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
                    PlusButton(array: self.$array, average: self.$average, total: self.$total)
                    Spacer()
                } .padding(.leading, 30)
            }
        }
    }
}

*/
