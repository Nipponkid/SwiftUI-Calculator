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
    
    var body: some View {
        Button(action: {}) {
            Text(digit)
                .padding()
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity)
        }
        .background(Color.gray)
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        DigitButton(digit: "1")
    }
}
