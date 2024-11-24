//
//  PlusButton.swift
//  dataTest
//
//  Created by Дмитрий Докукин on 01/08/2020.
//  Copyright © 2020 Дмитрий Докукин. All rights reserved.
//

import SwiftUI

struct PlusButton: View {
    @Binding var array: [AllInOne]
    @Binding var average: Float
    @Binding var total: Float
    
    @State var isPressed: Bool = false
    var body: some View {
        Button(action: {
            self.isPressed.toggle()
        }, label: {
            Text("+")
                    .font(.system(size: 70))
                    .frame(width: 70, height: 70)
                    .padding([.leading, .trailing], 4)
                    .padding(.bottom, 8)
                    .background(Color.gray.opacity(0.4)).cornerRadius(45)
  
        }) .sheet(isPresented: self.$isPressed, content: {
            PlusView(isPressed: self.$isPressed, array: self.$array, average: self.$average, total: self.$total)
        })
    }
}
/*
struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
} */
