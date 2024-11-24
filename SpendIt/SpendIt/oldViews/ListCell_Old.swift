//
//  ListCell.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 30/07/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI
/*
struct ListCell_Old: View {
    
    var element: AllInOne
    @State var isShowingCell = false
    @State var word: String = ""
    @State var calendar = Calendar.current
    @Binding var array: [AllInOne]
    @Binding var average: Float
    @Binding var total: Float
    var body: some View {
        // Каждый элемент - это кнопка
        
        Button(action: {
            self.word = self.element.description
            self.isShowingCell.toggle()
        }) {
            // Визуальное представление кнопки / самого элемента
            HStack{
                VStack(alignment: .leading) {
                    Text(element.description)
                        .font(.title)
                        .bold()
                    HStack{
                            Text(makeString(from: self.element.date, as: .date))
                                .font(.callout)
                            Text(makeString(from: self.element.date, as: .time))
                                .font(.callout)
                    }
                }
                Spacer()
                Text(String(element.money)+"₽")
                    .font(.title)
            }.padding(.horizontal, 20)
                // метод sheet открывает новое окно в виде карточки
            /*    .sheet(isPresented: $isShowingCell, content: {
                    // передаём данные в доп инфо окно элмента и открываем его
                    CellView_Old(element: self.element, isPressed: self.$isShowingCell, word: self.$word, array: self.$array, money: self.element.money, average: self.$average, total: self.$total)})
            */
                    // Данные передаются ссылочным образом, происходит связывание 
        } .padding(.trailing, 50)
       
    }
}
*/
/*struct ListCell_Previews: PreviewProvider {
    static var previews: some View {
        ListCell()
    }
} */
