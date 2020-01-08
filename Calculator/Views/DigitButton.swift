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
    let model: ContentViewModel
    
    var body: some View {
        Button(action: {
            self.model.receiveDigitString(self.digit)
        }) {
            Text(digit)
                .padding()
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(DigitButtonStyle())
    }
}

struct DigitButton_Previews: PreviewProvider {
    @State private static var model = ContentViewModel(for: Application())
    static var previews: some View {
        DigitButton(digit: "1", model: model)
    }
}
