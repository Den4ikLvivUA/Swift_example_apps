//
//  ViewController.swift
//  Calculator
//
//  Created by Den4ikLvivUA on 1/9/19.
//  Copyright © 2019 Den4ikLvivUA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberFromScreen : Double = 0.0
    var firstNum : Double = 0
    var operation : Int = 0
    var MathSym : Bool = false
    
    @IBOutlet weak var result: UILabel!
    @IBAction func digits(_ sender: UIButton) {
        if MathSym == true {
            result.text = String(sender.tag)
            MathSym = false
        }
        else {
            result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!)!
    }
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 12 && sender.tag != 17{
            firstNum = Double(result.text!)!
            if sender.tag == 13 {
                result.text = "/"
            }
            if sender.tag == 14 {
                result.text = "x"
            }
            if sender.tag == 15 {
                result.text = "-"
            }
            if sender.tag == 16 {
                result.text = "+"
            }
            
            operation = sender.tag
            MathSym = true
        }
        else if sender.tag == 17 {
            if operation == 13 { result.text = String(firstNum / numberFromScreen)}
            else if operation == 14 { result.text = String(firstNum * numberFromScreen)}
            else if operation == 15 { result.text = String(firstNum - numberFromScreen)}
            else if operation == 16 { result.text = String(firstNum + numberFromScreen)}
        }
        else if sender.tag == 12 {
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

