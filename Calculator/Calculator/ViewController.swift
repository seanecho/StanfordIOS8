//
//  ViewController.swift
//  Calculator
//
//  Created by Gaoxiao on 15/4/28.
//  Copyright (c) 2015年 Gaoxiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userInTheMiddleOfTypingANumber:Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleOfTypingANumber{
        display.text = display.text! + digit
        }else{
        display.text = digit
        userInTheMiddleOfTypingANumber = true
        }
    }
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userInTheMiddleOfTypingANumber{
            enter()
        }
        
        switch operation{
        case "×":performOperation(){$0 * $1}
        case "÷":performOperation(){$1 / $0}
        case "+":performOperation(){$0 + $1}
        case "−":performOperation(){$1 - $0}
        case "√":performOperation1(){sqrt($0)}
        default:break
        
        }
    }
        
    func performOperation(operation: (Double,Double) -> Double){
        if operandStack.count >= 2 {
                displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
                enter()
            }
        }
    func performOperation1(operation: Double -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }

    var operandStack = Array<Double>()
    @IBAction func enter(){
        userInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
    }

    var displayValue:Double{
    
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userInTheMiddleOfTypingANumber = false
        }
    }
    
}
