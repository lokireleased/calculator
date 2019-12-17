//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by tyson ericksen on 12/17/19.
//  Copyright © 2019 tyson ericksen. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = false
    var calculator = CalculatorLogic()
    
    var safeArea: UILayoutGuide {
        return self.view.safeAreaLayoutGuide
    }

    var numButtons: [UIButton] {
        return [numberOneButton, numberTwoButton, numberThreeButton, numberFourButton, numberFiveButton, numberSixButton, numberSevenButton, numberEightButton, numberNineButton, decimelButton]
    }
    
    var operationButtons: [UIButton] {
        return [clearButton, negativeButton, percentButton, divideButton, multiplyButton, plusButton, minusButton, equalButton]
    }
    
    var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func loadView() {
        super.loadView()
        createSubViews()
        constrainZeroStackView()
        constrainFirstStackView()
        constrainFourStackView()
        constrainSevenStackView()
        constrainClearStackView()
        constrainUltimateStackView()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        activateNumButtons()
        activateOperationButtons()
    }
    
    func createSubViews() {
        view.addSubview(numberZeroButton)
        view.addSubview(decimelButton)
        view.addSubview(equalButton)
        view.addSubview(zeroStackView)
        view.addSubview(numberOneButton)
        view.addSubview(numberTwoButton)
        view.addSubview(numberThreeButton)
        view.addSubview(minusButton)
        view.addSubview(oneStackView)
        view.addSubview(numberFourButton)
        view.addSubview(numberFiveButton)
        view.addSubview(numberSixButton)
        view.addSubview(plusButton)
        view.addSubview(fourStackView)
        view.addSubview(numberSevenButton)
        view.addSubview(numberEightButton)
        view.addSubview(numberNineButton)
        view.addSubview(multiplyButton)
        view.addSubview(sevenStackView)
        view.addSubview(clearButton)
        view.addSubview(negativeButton)
        view.addSubview(percentButton)
        view.addSubview(divideButton)
        view.addSubview(clearStackView)
        view.addSubview(ultimateStackView)
    }

    func activateOperationButtons() {
        operationButtons.forEach( {$0.addTarget(self, action: #selector(operationButtonTapped(sender:)), for: .touchUpInside)})
    }
    
    @objc func operationButtonTapped(sender: UIButton) {
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            guard let result = calculator.calculate(symbol: calcMethod) else { fatalError("error") }
            displayValue = result
        }
    }
    
    func activateNumButtons() {
        numButtons.forEach( { $0.addTarget(self, action: #selector(numButtonTapped(sender:)), for: .touchUpInside)})
        }
        
    @objc func numButtonTapped(sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                if displayLabel.text == nil {
                    displayLabel.text = numValue
                } else {
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
    }
    
    func constrainZeroStackView() {
        zeroStackView.translatesAutoresizingMaskIntoConstraints = false
        zeroStackView.addArrangedSubview(numberZeroButton)
        zeroStackView.addArrangedSubview(decimelButton)
        zeroStackView.addArrangedSubview(equalButton)
//        zeroStackView.bottomAnchor.constraint(equalTo: ultimateStackView.bottomAnchor).isActive = true
//        zeroStackView.leadingAnchor.constraint(equalTo: ultimateStackView.leadingAnchor).isActive = true
//        zeroStackView.trailingAnchor.constraint(equalTo: ultimateStackView.trailingAnchor).isActive = true
    }
    
    func constrainFirstStackView() {
        oneStackView.translatesAutoresizingMaskIntoConstraints = false
        oneStackView.addArrangedSubview(numberOneButton)
        oneStackView.addArrangedSubview(numberTwoButton)
        oneStackView.addArrangedSubview(numberThreeButton)
        oneStackView.addArrangedSubview(minusButton)
//        oneStackView.bottomAnchor.constraint(equalTo: zeroStackView.topAnchor).isActive = true
//        oneStackView.leadingAnchor.constraint(equalTo: ultimateStackView.leadingAnchor).isActive = true
//        oneStackView.trailingAnchor.constraint(equalTo: ultimateStackView.trailingAnchor).isActive = true
    }
    
    func constrainFourStackView() {
        fourStackView.translatesAutoresizingMaskIntoConstraints = false
        fourStackView.addArrangedSubview(numberFourButton)
        fourStackView.addArrangedSubview(numberFiveButton)
        fourStackView.addArrangedSubview(numberSixButton)
        fourStackView.addArrangedSubview(plusButton)
//        fourStackView.bottomAnchor.constraint(equalTo: oneStackView.topAnchor).isActive = true
//        fourStackView.leadingAnchor.constraint(equalTo: ultimateStackView.leadingAnchor).isActive = true
//        fourStackView.trailingAnchor.constraint(equalTo: ultimateStackView.trailingAnchor).isActive = true
    }
    
    func constrainSevenStackView() {
        sevenStackView.translatesAutoresizingMaskIntoConstraints = false
        sevenStackView.addArrangedSubview(numberSevenButton)
        sevenStackView.addArrangedSubview(numberEightButton)
        sevenStackView.addArrangedSubview(numberNineButton)
        sevenStackView.addArrangedSubview(multiplyButton)
//        sevenStackView.bottomAnchor.constraint(equalTo: fourStackView.topAnchor).isActive = true
//        sevenStackView.leadingAnchor.constraint(equalTo: ultimateStackView.leadingAnchor).isActive = true
//        sevenStackView.trailingAnchor.constraint(equalTo: ultimateStackView.trailingAnchor).isActive = true
    }
    
    func constrainClearStackView() {
        clearStackView.translatesAutoresizingMaskIntoConstraints = false
        clearStackView.addArrangedSubview(clearButton)
        clearStackView.addArrangedSubview(negativeButton)
        clearStackView.addArrangedSubview(percentButton)
        clearStackView.addArrangedSubview(divideButton)
//        clearStackView.bottomAnchor.constraint(equalTo: sevenStackView.topAnchor).isActive = true
//        clearStackView.leadingAnchor.constraint(equalTo: ultimateStackView.leadingAnchor).isActive = false
//        clearStackView.trailingAnchor.constraint(equalTo: ultimateStackView.trailingAnchor).isActive = false
//        clearStackView.topAnchor.constraint(equalTo: ultimateStackView.topAnchor).isActive = true
    }

    func constrainUltimateStackView() {
        ultimateStackView.translatesAutoresizingMaskIntoConstraints = false
        ultimateStackView.addArrangedSubview(displayLabel)
        ultimateStackView.addArrangedSubview(clearStackView)
        ultimateStackView.addArrangedSubview(sevenStackView)
        ultimateStackView.addArrangedSubview(fourStackView)
        ultimateStackView.addArrangedSubview(oneStackView)
        ultimateStackView.addArrangedSubview(zeroStackView)
        ultimateStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15).isActive = true
        ultimateStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: 15).isActive = true
        ultimateStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 15).isActive = true
        ultimateStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -15).isActive = true
    }
    
    let numberZeroButton: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let decimelButton: UIButton = {
        let button = UIButton()
        button.setTitle(".", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let equalButton: UIButton = {
        let button = UIButton()
        button.setTitle("=", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let zeroStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    let numberOneButton: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let numberTwoButton: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let numberThreeButton: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()

    let oneStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
    
    let numberFourButton: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let numberFiveButton: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let numberSixButton: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let fourStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
       return stackView
    }()
    
    let numberSevenButton: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let numberEightButton: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let numberNineButton: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let multiplyButton: UIButton = {
        let button = UIButton()
        button.setTitle("*", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let sevenStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
       return stackView
    }()
    
    let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle("C", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let negativeButton: UIButton = {
        let button = UIButton()
        button.setTitle("+/-", for: .normal)
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let percentButton: UIButton = {
        let button = UIButton()
        button.setTitle("%", for: .normal)
        button.backgroundColor = .orange
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let divideButton: UIButton = {
        let button = UIButton()
        button.setTitle("/", for: .normal)
        button.backgroundColor = .orange
        button.contentHorizontalAlignment = .center
        return button
    }()
    
    let clearStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
       return stackView
    }()
    
    let displayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        return label
    }()
    
    let ultimateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        return stackView
    }()
}
