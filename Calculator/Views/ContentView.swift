//
//  ContentView.swift
//  Calculator
//
//  Created by Wesley Brown on 11/23/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var model: ContentViewModel
    
    @State private var additionButtonIsPressed = false
    
    init(model: ContentViewModel) {
        self.model = model
    }
    
    var body: some View {
        VStack {
            NumberDisplay(numberString: model.display)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            
            HStack {
                Button(action: {
                    self.model.reset()
                }) {
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
                
                Button(action: {
                    self.model.specifyOperation(.division)
                }) {
                    Text("÷")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.orange)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "7", model: model)
                DigitButton(digit: "8", model: model)
                DigitButton(digit: "9", model: model)
                
                Button(action: {
                    self.model.specifyOperation(.multiplication)
                }) {
                    Text("x")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.orange)
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "4", model: model)
                DigitButton(digit: "5", model: model)
                DigitButton(digit: "6", model: model)
                
                if model.state == .operationSpecified && model.operation == .subtraction {
                    SubtractionButton(
                        model: model,
                        backgroundColor: .white,
                        foregroundColor: .orange
                    )
                } else {
                    SubtractionButton(
                        model: model,
                        backgroundColor: .orange,
                        foregroundColor: .white
                    )
                }
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "1", model: model)
                DigitButton(digit: "2", model: model)
                DigitButton(digit: "3", model: model)
                
                if model.state == .operationSpecified && model.operation == .addition {
                    AdditionButton(
                        model: model,
                        backgroundColor: .white,
                        foregroundColor: .orange
                    )
                } else {
                    AdditionButton(
                        model: model,
                        backgroundColor: .orange,
                        foregroundColor: .white
                    )
                }
            }
            
            Spacer()
            
            HStack {
                DigitButton(digit: "0", model: model)
                    .frame(maxWidth: .infinity)
                
                Button(action: {}) {
                    Text(".")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                
                Button(action: {
                    self.model.performOperation()
                }) {
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
    static let app = Application()
    static let model = ContentViewModel(for: app)
    static var previews: some View {
        ContentView(model: model)
            .previewDevice(PreviewDevice(rawValue: "iPhone 8 Plus"))
    }
}
