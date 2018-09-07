//
//  ViewController.swift
//  Calculator
//
//  Created by Rangga Senatama Putra on 04/09/18.
//  Copyright © 2018 Rangga Senatama Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var doubleMode: Bool = false
    var restartBoard: Bool = true
    var operationSelected: Int = 0
    var firstNumber: Double = 0.0
    
    @IBOutlet weak var textUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        if restartBoard {
            reset()
            restartBoard = false
        }
        guard var current = textUILabel.text else { fatalError("Error textUILabel nil") }
        
        //Coma pressed
        if sender.tag == 10 {
            if !(current.contains(".")) {
                current += String(".")
                doubleMode = true
                textUILabel.text = current
                return
            }
        } else {
            current += String(sender.tag)
        }
        
        //check if coma has been pressed
        if doubleMode {
            let insert = Double(current)
            textUILabel.text = String(insert!)
        } else {
            let insert = Int(current)
            textUILabel.text = String(insert!)
        }
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        
        operationSelected = sender.tag
        firstNumber = Double(textUILabel.text!)!
        restartBoard = true
    }
    
    @IBAction func performMathPressed(_ sender: UIButton) {
        let secondNumber = Double(textUILabel.text!)!
        
        //choose operation
        switch operationSelected {
        case 11:
            firstNumber /= secondNumber
        case 12:
            firstNumber *= secondNumber
        case 13:
            firstNumber -= secondNumber
        case 14:
            firstNumber += secondNumber
        default:
            print("No input option")
        }
        
        restartBoard = true
        textUILabel.text = String(firstNumber)
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        operationSelected = 0
        reset()
    }
    
    @IBAction func perHundredPressed(_ sender: UIButton) {
        var current = Double(textUILabel.text!)!
        current /= 100
        textUILabel.text = String(current)
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: UIButton) {
        var number = ""
        if doubleMode {
            if let current = textUILabel.text {
                var currentNumber = Double(current)!
                currentNumber *= -1
                number = String(currentNumber)
            }
        } else {
            if let current = textUILabel.text {
                var currentNumber = Int(current)!
                currentNumber *= -1
                number = String(currentNumber)
            }
        }
        textUILabel.text = number
    }
    
    func reset() {
        doubleMode = false
        textUILabel.text = "0"
    }
    
}

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
