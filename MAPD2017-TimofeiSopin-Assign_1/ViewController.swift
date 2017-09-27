//
//  ViewController.swift
//  Timofei Sopin
//  Student ID 300965775
//  Created 2017-09-20
//  MAPD2017-TimofeiSopin-Assign_1_Simple_Calculator
//  Ver. 1.0.0
//  Copyright © 2017 Centennial College. All rights reserved.
//
import UIKit
import Darwin

enum modes {
    case notSet
    case addition
    case subtraction
    case multuiplication
    case division
    case squareRoot
    case percent
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var labelString:String = "0"
    var currentMode:modes = .notSet
    var savedNum:Double = 0
    var lastButtonWasMode:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Dot button clicked
    @IBAction func didPressDot(_ sender: UIButton) {
        if (!(label.text?.contains("."))!){
            labelString = (label.text?.appending("."))!
            label.text = labelString
        }
    }
    // +/- button clicked
    @IBAction func didPressPM(_ sender: UIButton) {
        
        if (!(label.text?.contains("-"))!) {
            labelString = "-\(label.text!)"
        }
        else {
            let negative = label.text!.index(label.text!.startIndex, offsetBy: 1)
            labelString = label.text!.substring(from: negative)
            }
            label.text = labelString
    }
    // Plus button clicked
    @IBAction func didPressPlus(_ sender: AnyObject) {
        changeMode(newMode: .addition)
    }
    // Substract button clicked
    @IBAction func didPressSubtract(_ sender: AnyObject) {
        changeMode(newMode: .subtraction)
    }
    // Multiply button clicked
    @IBAction func didPressMultiply(_ sender: UIButton) {
        changeMode (newMode: .multuiplication)
    }
    // Devision button clicked
    @IBAction func didPressDivision(_ sender: UIButton) {
        changeMode(newMode: .division)
    }
    // Square Root button clicked
    @IBAction func didPressSqRt(_ sender: UIButton) {
        changeMode(newMode: .squareRoot)
    }
    @IBAction func didPressPercent(_ sender: UIButton) {
        changeMode(newMode: .percent)
    }
    // Equals button clicked
    @IBAction func didPressEquals(_ sender: AnyObject) {
        guard let labelInt:Double = Double(labelString) else {
            return
        }
        if (currentMode == .notSet || lastButtonWasMode) {
            return
        }
        if (currentMode == .addition) {
            savedNum += labelInt
        }
        else if(currentMode == .subtraction) {
            savedNum -= labelInt
        }
        else if(currentMode == .multuiplication) {
            savedNum *= labelInt
        }
        else if(currentMode == .division) {
            savedNum /= labelInt
        }
        else if(currentMode == .squareRoot) {
            savedNum = sqrt(savedNum)
        }
        
        currentMode = .notSet
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    @IBAction func didPressClear(_ sender: AnyObject) {
        
        labelString = "0"
        currentMode = .notSet
        savedNum = 0
        lastButtonWasMode = false
        label.text = "0"
        
    }
    @IBAction func didPressNumber(_ sender: UIButton) {
        let stringValue:String? = sender.titleLabel?.text
        
        if (lastButtonWasMode) {
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString = labelString.appending(stringValue!)
        updateText()
    }
    
    func updateText() {
        guard let labelInt:Double = Double(labelString) else {
            return
        }
        if (currentMode == .notSet) {
            savedNum = labelInt
        }
        
        let formatNumber:NumberFormatter = NumberFormatter()
        formatNumber.numberStyle = .decimal
        formatNumber.maximumFractionDigits = 8
        let number:NSNumber = NSNumber(value: labelInt)
        
        label.text = formatNumber.string(from: number)
        
    }
    
    func changeMode(newMode:modes) {
        if (savedNum == 0) {
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
    }
    
    

    
    
}


