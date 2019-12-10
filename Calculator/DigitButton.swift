//
//  DigitButton.swift
//  Calculator
//
//  Created by Wesley Brown on 11/27/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct DigitButton: View {
    let digit: String
    @Binding var numberString: String
    
    var body: some View {
        Button(action: appendDigitToNumberString) {
            Text(digit)
                .padding()
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity)
        }
        .background(Color.gray)
    }
    
    private func appendDigitToNumberString() {
        if numberString == "0" {
            numberString = digit
        } else {
            numberString += digit
        }
    }
}

struct NumberButton_Previews: PreviewProvider {
    @State static var display = "0"
    static var previews: some View {
        DigitButton(digit: "1", numberString: $display)
    }
}
