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
    
    // MARKS: Actions
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if display.text! == "0" {
            display.text = digit
        }else{
            display.text! = display.text! + digit
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

