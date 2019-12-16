//
//  ViewController.swift
//  Calculator
//
//  Created by tyson ericksen on 12/16/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var returnLabel: UILabel!
    
    var calculator = CalculatorLogic()
    private var isFinishedTypeingNumber: Bool = false
    
    var displayValue: Double {
        get {
            guard let number = Double(returnLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        set {
            returnLabel.text = String(newValue)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        
        isFinishedTypeingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            guard let result = calculator.calculate(symbol: calcMethod) else { fatalError("error") }
            displayValue = result
        }
    }
    
    
    @IBAction func numButtonTapped(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTypeingNumber {
                returnLabel.text = numValue
                isFinishedTypeingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                        
                    }
                }
                returnLabel.text = returnLabel.text! + numValue
             }
        }
    }
}

