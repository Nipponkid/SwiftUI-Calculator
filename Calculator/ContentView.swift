//
//  ContentView.swift
//  Calculator
//
//  Created by Wesley Brown on 11/23/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input = "0"
    
    var body: some View {
        VStack {
            NumberDisplay(number: input)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            
            HStack {
                Button(action: {}) {
                    Text("AC")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.white)
                
                Button(action: {}) {
                    Text("+/-")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.white)
                
                Button(action: {}) {
                    Text("%")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.white)
                
                Button(action: {}) {
                    Text("÷")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.orange)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "7", number: $input)
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "8", number: $input)
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "9", number: $input)
                    .frame(maxWidth: .infinity)
                
                Button(action: {}) {
                    Text("x")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.orange)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "4", number: $input)
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "5", number: $input)
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "6", number: $input)
                    .frame(maxWidth: .infinity)
                
                Button(action: {}) {
                    Text("-")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.orange)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "1", number: $input)
                    .frame(maxWidth: .infinity)

                DigitButton(digit: "2", number: $input)
                    .frame(maxWidth: .infinity)
                
                DigitButton(digit: "3", number: $input)
                    .frame(maxWidth: .infinity)
                
                Button(action: {}) {
                    Text("+")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.orange)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "0", number: $input)
                    .frame(maxWidth: .infinity)
                
                Button(action: {}) {
                    Text(".")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                
                Button(action: {}) {
                    Text("=")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.orange)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
    }
}
