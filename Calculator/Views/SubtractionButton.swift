//
//  SubtractionButton.swift
//  Calculator
//
//  Created by Wesley Brown on 1/8/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

import SwiftUI

struct SubtractionButton: View {
    let model: ContentViewModel
    let backgroundColor: Color
    let foregroundColor: Color
    
    var body: some View {
        Button(action: {
            self.model.specifyOperation(.subtraction)
        }) {
            Text("-")
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
    }
}

struct SubtractionButton_Previews: PreviewProvider {
    @State private static var model = ContentViewModel(for: Application())
    static var previews: some View {
        SubtractionButton(
            model: model,
            backgroundColor: .orange,
            foregroundColor: .white
        ).previewLayout(.sizeThatFits)
    }
}
