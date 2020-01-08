//
//  DigitButtonStyle.swift
//  Calculator
//
//  Created by Wesley Brown on 1/8/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

import Foundation
import SwiftUI

struct DigitButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.gray : Color(red: 0.3, green: 0.3, blue: 0.3))
    }
}
