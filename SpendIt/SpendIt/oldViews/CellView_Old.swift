//
//  CellView.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 30/07/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//
/*
import SwiftUI

struct CellView_Old: View {
   
    @State var isActivate = false
    
    @State var element: AllInOne
    @Binding var isPressed: Bool
    @Binding var word: String 
    @Binding var array: [AllInOne]
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
                self.array[self.element.id] = self.element
                BigArray = self.array
                //self.array = BigArray
                self.average = averageSpend(array: self.array) //
                self.total = totalSpend(array: self.array) //
                
                saveData(array: BigArray)
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
                self.isPressed.toggle()
                //BigArray.remove(at: self.element.id)
                //self.array.remove(at: self.element.id) //
                if (BigArray.count == 1) {
                    BigArray = []
                    self.array = []
                    self.average = averageSpend(array: self.array)
                    self.total = totalSpend(array: self.array)
                } else {
                    print(self.element.id)
                    self.array.remove(at: self.element.id)
                    self.array = restoreID(eArray: self.array)
                    BigArray = self.array
                    //self.array = BigArray
                    self.average = averageSpend(array: self.array)
                    self.total = totalSpend(array: self.array)
                }
                
                saveData(array: BigArray)
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
 
 */
 
/*
struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(description: "", money: 0.0, date: Date(timeIntervalSinceNow: 3600*3))
    }
} */
