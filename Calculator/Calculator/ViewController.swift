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
        case "×": performOperation(multiply)
//        case "÷":performOperation(divide)
//        case "+":performOperation(add)
//        case "−":performOperation(subtract)
        default:break
        
        }
    }
        
        func performOperation(operation: (Double,Double) -> Double){
            if operandStack.count >= 2 {
                displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
                enter()
            }
        }
        
        func multiply(op1: Double , op2: Double) -> Double{
            return op1 * op2
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
