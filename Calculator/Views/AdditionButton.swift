//
//  AdditionButton.swift
//  Calculator
//
//  Created by Wesley Brown on 12/6/19.
//  Copyright © 2019 Wesley Brown. All rights reserved.
//

import SwiftUI

struct AdditionButton: View {
    @State private var isPressed = false
    @State private var backgroundColor = Color.orange
    @State private var foregroundColor = Color.white
    let model: ContentViewModel
    
    var body: some View {
        Button(action: {
            self.model.specifyOperation(.addition)
            self.swapBackgroundAndForegroundColors()
        }) {
            Text("+")
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
    }
    
    private func swapBackgroundAndForegroundColors() {
        let temp = backgroundColor
        backgroundColor = foregroundColor
        foregroundColor = temp
    }
}

struct AdditionButton_Previews: PreviewProvider {
    @State private static var model = ContentViewModel(for: Application())
    static var previews: some View {
        AdditionButton(model: model).previewLayout(.sizeThatFits)
    }
}
