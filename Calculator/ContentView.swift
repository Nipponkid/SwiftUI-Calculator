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
                Button(action: {
                    self.number += "7"
                }) {
                    Text("7")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    self.number += "8"
                }) {
                    Text("8")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                
                Button(action: {
                    self.number += "9"
                }) {
                    Text("9")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    self.number += "4"
                }) {
                    Text("4")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    self.number += "5"
                }) {
                    Text("5")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                
                Button(action: {
                    self.number += "6"
                }) {
                    Text("6")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
            }
            
            Spacer()
            
            HStack {
                Button(action: {
                    self.number += "1"
                }) {
                    Text("1")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    self.number += "2"
                }) {
                    Text("2")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
                
                Button(action: {
                    self.number += "3"
                }) {
                    Text("3")
                        .padding()
                        .foregroundColor(Color.black)
                        .frame(maxWidth: .infinity)
                }
                .background(Color.gray)
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
