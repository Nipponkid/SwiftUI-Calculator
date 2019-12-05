//
//  NumberDisplay.swift
//  Calculator
//
//  Created by Wesley Brown on 12/5/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct NumberDisplay: View {
    private(set) var number: String = "0"
    
    var body: some View {
        Text(number)
            .font(.system(size: 60))
            .multilineTextAlignment(.trailing)
            .foregroundColor(Color.white)
    }
}

struct NumberDisplay_Previews: PreviewProvider {
    @State static private var number = "0"
    
    static var previews: some View {
        NumberDisplay(number: "212641682641")
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
