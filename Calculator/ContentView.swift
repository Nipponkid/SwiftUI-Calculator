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
            TextField("", text: $input)
            
            Button(action: {
                self.appendToNumberArea("1")
            }) {
                Text("1")
                .padding()
            }
            .background(Color.gray)
        }
    }
    
    private func appendToNumberArea(_ number: String) {
        if (input == "0") {
            // No leading zeroes
            input = number
        } else {
            input += number
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
