//
//  ContentView.swift
//  Calculator
//
//  Created by Wesley Brown on 11/23/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var number = "0"
    
    var body: some View {
        VStack {
            Text(number)
                .font(.system(size: 60))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                .multilineTextAlignment(.trailing)
            
            HStack {
                DigitButton(digit: "7")
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "8")
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "9")
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "4")
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "5")
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "6")
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "1")
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "2")
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "3")
                    .frame(maxWidth: .infinity)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
    }
}
