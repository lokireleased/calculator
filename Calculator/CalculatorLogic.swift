//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by tyson ericksen on 12/16/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var method: String?
    private var intermediateCalculation: (n1: Double, calcMethod: String)? {
        guard let number = number, let method = method else { return nil }
        return (number, method)
    }
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                method = symbol
                return n * -1
            case "%":
                method = symbol
                return n * 0.01
            case "C":
                return 0
            case "+":
                method = symbol
                return n
            case "-":
                method = symbol
                return n
            case "/":
                method = symbol
                return n
            case "X":
                method = symbol
                return n
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                break
            }
        }
        return nil
    }
        
    func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case "+":
                return n1 + n2
            case "X":
                return n1 * n2
            case "/":
                return n1 / n2
            case "-":
                return n1 - n2
            default:
                fatalError("The operation passed in does not match any of the cases")
            }
        }
        return nil
    }
}
