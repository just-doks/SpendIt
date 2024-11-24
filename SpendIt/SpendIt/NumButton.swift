//
//  NumButton.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 31/07/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct NumButton: View {
    var isSwitch: Bool
    @Binding var number: Float
    var numeral: Int
    
    func calcForF(money: Float, numeral: Int) -> (Float) {
        var o: Int = 0
        var x: Int = 0
        let a: Int = Int(money*10)
        let b: Int = Int(money*100)
        let c: Int = Int(money)
        if (a > c * 10 && b > a * 10) {
            return money
        } else if (b > a * 10) {
            x = (b - (a * 10)) * 10
            o = a * 10 + x + numeral
        }
        else {
            o = b + numeral
            
        }
        
        return Float(o)/100
    }
    
    func calcOp(money: Float, numeral: Int) -> Float {
        let b: Float = money - Float(Int(money))
        //let step: Float = 0.01
        var a: Int = 0
        a = Int(money)*10 + numeral
        return Float(a)+b
    }
    
    var body: some View {
        Button (action: {
            if (self.number >= 100_000) {} else {
                if (self.isSwitch==false) {
                    self.number = self.calcOp(money: self.number, numeral: self.numeral)
                } else {
                    self.number = self.calcForF(money: self.number, numeral: self.numeral)
                }
            }
        }) {
            ZStack{
                Circle()
                    .frame(width: 80, height: 80, alignment: .center)
                    .foregroundColor(.gray).opacity(0.7)
                Text(String(numeral)).font(.largeTitle)
            }
        }.padding(.all, 10)
    }
}
/*
struct NumButton_Previews: PreviewProvider {
    static var previews: some View {
        NumButton
    }
} */
