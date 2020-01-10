//
//  EqualsButtonStyle.swift
//  Calculator
//
//  Created by Wesley Brown on 1/10/20.
//  Copyright © 2020 Wesley Brown. All rights reserved.
//

import Foundation
import SwiftUI

struct EqualsButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.white : Color.orange)
    }
}
