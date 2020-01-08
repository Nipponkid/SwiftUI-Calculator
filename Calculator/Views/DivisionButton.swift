//
//  DivisionButton.swift
//  Calculator
//
//  Created by Wesley Brown on 1/8/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

import SwiftUI

struct DivisionButton: View {
    let model: ContentViewModel
    let backgroundColor: Color
    let foregroundColor: Color
    
    var body: some View {
        Button(action: {
            self.model.specifyOperation(.division)
        }) {
            Text("÷")
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
    }
}

struct DivisionButton_Previews: PreviewProvider {
    @State private static var model = ContentViewModel(for: Application())
    static var previews: some View {
        DivisionButton(
            model: model,
            backgroundColor: .orange,
            foregroundColor: .white
        ).previewLayout(.sizeThatFits)
    }
}
