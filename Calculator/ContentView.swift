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
                DigitButton(digit: "7", number: $number)
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "8", number: $number)
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "9", number: $number)
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "4", number: $number)
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "5", number: $number)
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "6", number: $number)
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "1", number: $number)
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "2", number: $number)
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "3", number: $number)
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
