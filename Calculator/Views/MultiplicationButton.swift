//
//  MultiplicationButton.swift
//  Calculator
//
//  Created by Wesley Brown on 1/8/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

import SwiftUI

struct MultiplicationButton: View {
    let model: ContentViewModel
    let backgroundColor: Color
    let foregroundColor: Color
    
    var body: some View {
        Button(action: {
            self.model.specifyOperation(.multiplication)
        }) {
            Text("x")
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
    }
}

struct MultiplicationButton_Previews: PreviewProvider {
    @State private static var model = ContentViewModel(for: Application())
    static var previews: some View {
        MultiplicationButton(
            model: model,
            backgroundColor: .orange,
            foregroundColor: .white
        ).previewLayout(.sizeThatFits)
    }
}
