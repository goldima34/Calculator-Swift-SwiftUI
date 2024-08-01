//
//  Extension.swift
//  Calculator
//
//  Created by Дмитрий Головащук on 31.07.2024.
//

import SwiftUI

extension Color{
    static let darkGrayCalc = Color("darkGrayCalc")
    static let grayCalc = Color("grayCalc")
    static let orangeCalc = Color("orangeCalc")
}

extension Buttons {
    func buttonTwoOperation() -> Operation {
        switch self {
        case .plus:
            return .addition
        case .minus:
            return .subtract
        case .multiplie:
            return .multiply
        case .divide:
            return .divide
        default:
            return .none
        }
    }
}
