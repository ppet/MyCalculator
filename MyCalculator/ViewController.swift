//
//  ViewController.swift
//  MyCalculator
//
//  Created by Philippe petit on 28/12/2015.
//  Copyright © 2015 Philippe petit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARKS: Properties
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTypingANumber = false
    var operandStack = Array<Double>()
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    // MARKS: Actions
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text! = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "✕":
                print("In multiply")
                performOperation { $0 * $1 }
            
            case "+":
                print("In add")
                performOperation { $0 + $1 }
            
            case "−":
                print("In minus")
                performOperation { $1 - $0 }
            
            case "÷":
                print("In divide")
                performOperation { $1 / $0 }
            
            case "√":
                print("In square")
                performOperation { sqrt($0) }
            
            default: break
        }
        
    }

    func performOperation(operation: (Double, Double) -> Double) {
        if operandStack.count >= 2{
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    // "private" very important to avoid a conflict while linking in Objective-C
    // http://stackoverflow.com/questions/29457720/compiler-error-method-with-objective-c-selector-conflicts-with-previous-declara
    private func performOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    // MARKS: Auto
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

