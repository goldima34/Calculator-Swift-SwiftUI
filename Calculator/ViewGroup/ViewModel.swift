//
//  ViewModel.swift
//  Calculator
//
//  Created by Дмитрий Головащук on 01.08.2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var value = "0"
    @Published var number: Double = 0.0
    @Published var currentOperation: Operation = .none
    
    //property
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiplie],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    func didTap(item: Buttons)  {
        switch item {
        case .plus, .minus, .multiplie, .divide:
            currentOperation = item.buttonTwoOperation()
            number = Double(value) ?? 0
            value = "0"
        case .equal:
            if let currentValue = Double(value){
                value = formatResult(performOperation(currentValue))
            }
        case .decimal:
            if !value.contains(",") {
                value += "."
            }
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                value = formatResult(-currentValue)
            }
        case .clear:
            value = "0"
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
    
    func formatResult(_ result: Double) -> String {
        return String(format: "%g", result)
    }
    
    func performOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .subtract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    func buttonWidth(item: Buttons) -> CGFloat{
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let zeroTotalSpacing: CGFloat = 4 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - zeroTotalSpacing) / totalColumns * 2
        }
        
        return (screenWidth - totalSpacing) / totalColumns
    }
    
    func buttonHeight() -> CGFloat{
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = 5 * spacing
        let totalColumns: CGFloat = 4
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth - totalSpacing) / totalColumns
    }
}
