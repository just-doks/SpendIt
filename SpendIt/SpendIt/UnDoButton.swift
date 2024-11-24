//
//  UnDoButton.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 01/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct UnDoButton: View {
    @Binding var number: Float
    func undo(money: Float) -> Float {
           print(money) // 10.99
           var o: Int = 0
           let a: Int = Int(money*10) // 109
           let b: Int = Int(money*100) // 1099
           let c: Int = Int(money) // 10
           
           print(a, b, c)
           if (b > a * 10) {
               o = a * 10
            
           } else if (a > c * 10) {
               o = c * 100
               print("2 ", o)
           } else {
               o = (c / 10) * 100
           }
           return  Float(o)/100
       }
    
    var body: some View {
        Button(action: {
            self.number = self.undo(money: self.number)
            
        }) {
            ZStack{
                Circle()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(.gray).opacity(0.7)
                Text("<-").font(.largeTitle)
            }
        }.padding(.all, 10)
    }
}

/*
struct UnDoButton_Previews: PreviewProvider {
    static var previews: some View {
        UnDoButton()
    }
}
*/
