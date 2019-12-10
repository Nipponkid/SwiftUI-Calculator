//
//  NumberDisplay.swift
//  Calculator
//
//  Created by Wesley Brown on 12/5/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct NumberDisplay: View {
    let numberString: String
    
    var body: some View {
        Text(numberString)
            .font(.system(size: 60))
            .multilineTextAlignment(.trailing)
            .foregroundColor(Color.white)
    }
}

struct NumberDisplay_Previews: PreviewProvider {
    static var previews: some View {
        NumberDisplay(numberString: "212641682641")
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
