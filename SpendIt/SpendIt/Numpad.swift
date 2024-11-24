//
//  Numpad.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 30/07/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct Numpad: View {
    @Binding var number: Float
    @State var switcher: Bool = false
    
    var body: some View {
        VStack {
            HStack { // 1
                Spacer()
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 7)
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 8)
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 9)
                Spacer()
            } // 1
            
            HStack { // 2
                Spacer()
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 4)
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 5)
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 6)
                Spacer()
            } // 2
            
            HStack { // 3
                Spacer()
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 1)
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 2)
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 3)
                Spacer()
            } // 3
            
            HStack { // 4
                Spacer()
                DotButton(isPressed: self.$switcher)
                NumButton(isSwitch: self.switcher, number: self.$number, numeral: 0)
                UnDoButton(number: self.$number)
                Spacer()
            } // 4
        }
    }
}

/*
struct Numpad_Previews: PreviewProvider {
    static var previews: some View {
        Numpad()
    }
} */
