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

}


