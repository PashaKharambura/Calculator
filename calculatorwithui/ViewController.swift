//
//  ViewController.swift
//  CalculatorWithUI
//
//  Created by Kirill Kirikov on 5/7/17.
//  Copyright © 2017 GoIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var didInputStarted:Bool = false
    var model = CalculatorModel()
    var dotNotTapped = true
    var currentDisplayValue: Double {
        set {
            inputDisplay.text = String(newValue)
        }
        get {
            return Double(inputDisplay.text!)!
        }
    }
    
    @IBOutlet weak var inputDisplay: UITextField!
    
    @IBAction func touchDigit(_ sender: UIButton) {
     
        if didInputStarted {
            inputDisplay.text = inputDisplay.text! + sender.currentTitle!
              if ( inputDisplay.text?.contains("."))! {          // no 2 and morre dots
                    dotNotTapped = false
            } else {
                dotNotTapped = true
            }
        } else if sender.currentTitle! != "0" {
            inputDisplay.text = sender.currentTitle!
            didInputStarted = true
        }

    }
    
    @IBAction func putDot(_ sender: UIButton) {
        if (!didInputStarted){
            inputDisplay.text = "0."
            didInputStarted = true
        } else if (dotNotTapped) {
        inputDisplay.text = "\(inputDisplay.text!)\(sender.currentTitle!)"
        }
        dotNotTapped = false
    }
    
    
        @IBAction func performOperation(_ sender: UIButton) {
        
        guard let currentValue = Double(inputDisplay.text!) else {
            return
        }
        
        model.setOperand(currentValue)
        model.performOperation(sender.currentTitle!)
        currentDisplayValue = model.result ?? 0
        dotNotTapped = true
        didInputStarted = false
    }
}


    

