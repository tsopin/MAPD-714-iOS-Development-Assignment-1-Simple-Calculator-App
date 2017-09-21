//
//  ViewController.swift
//  Calculator
//
//  Created by Todd Perkins on 10/28/16.
//  Copyright © 2016 Todd Perkins. All rights reserved.
//

import UIKit

enum modes {
    case not_set
    case addition
    case subtraction
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func didPressPlus(_ sender: AnyObject) {
        
        changeMode(newMode: .addition)
    }
    
    @IBAction func didPressSubtract(_ sender: AnyObject) {
        changeMode(newMode: .subtraction)
    }
    @IBAction func didPressEquals(_ sender: AnyObject) {
    }
    @IBAction func didPressClear(_ sender: AnyObject) {
        
        labelString = "0"
        currentMode = .not_set
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
        guard let labelInt:Int = Int(labelString) else {
            return
        }
        
        if (currentMode == .not_set){
            savedNum = labelInt
        }
        
        label.text = "\(labelInt)"
    }
    
    func changeMode(newMode:modes) {
        if (savedNum == 0) {
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
        
    }
    
    
}

