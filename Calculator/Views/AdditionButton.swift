//
//  AdditionButton.swift
//  Calculator
//
//  Created by Wesley Brown on 12/6/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct AdditionButton: View {
    let model: ContentViewModel
    let backgroundColor: Color
    let foregroundColor: Color
    
    var body: some View {
        Button(action: {
            self.model.specifyOperation(.addition)
        }) {
            Text("+")
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
    }
}

struct AdditionButton_Previews: PreviewProvider {
    @State private static var model = ContentViewModel(for: Application())
    static var previews: some View {
        AdditionButton(
            model: model,
            backgroundColor: .orange,
            foregroundColor: .white
        ).previewLayout(.sizeThatFits)
    }
}
