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
        case "×":
            if operandStack.count >= 2 {
                displayValue = operandStack.removeLast() * operandStack.removeLast()
            }
        case "÷":
            displayValue = operandStack.removeLast() * operandStack.removeLast()
        case "+":
            displayValue = operandStack.removeLast() + operandStack.removeLast()
        case "−":
            displayValue = operandStack.removeLast() * operandStack.removeLast()
        default:break
        
        }
        func performOperation (){
        
        
        }
        
    }
    
    var operandStack = Array<Double>()
    @IBAction func enter() {
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


