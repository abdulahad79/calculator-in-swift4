//
//  ViewController.swift
//  calculator
//
//  Created by ZOHAIB  on 07/02/2019.
//  Copyright © 2019 ZOHAIB . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelview: UITextField!
    var currentOp: Operator = Operator.Nothing
    var calcState: CalcState = CalcState.enteringNumb
    var firstValue: String  = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func numberClicked (_ sender: UIButton){
        
        updateDisplay(number: String(sender.tag))
        
        
    }
    
    func updateDisplay(number: String) {
        
        if calcState == CalcState.newNumbStart{
            
            if let num = labelview.text {
                if num != "" {
                    firstValue = num
                }
            }
            calcState = CalcState.enteringNumb
            labelview.text = number
            
            
        }else if calcState == CalcState.enteringNumb {
            labelview.text = labelview.text! + number
            
        }
        
    }
    
    
    @IBAction func operatorClick (_ sender: UIButton){
        calcState = CalcState.newNumbStart
        if let num = labelview.text{
        if num != "" { 
            firstValue = num
            labelview.text = ""
        
        }
        }
        
        switch sender.tag {
        case 10:
            currentOp = Operator.Times
        case 11:
            currentOp = Operator.Minus
        case 12:
            currentOp = Operator.Divide
        case 13:
            currentOp = Operator.Add 
        default:
            return
            
        }
        
        
    }
    
    
    @IBAction func equal (_ sender: UIButton){
    calcualteSum()
        
    
    }
    
    func calcualteSum () {
        
        if firstValue.isEmpty {
            return
        }
        var result = ""
        if currentOp == Operator.Times {
            result = "\(Double(firstValue)! * Double(labelview.text!)!)"
        }else if currentOp == Operator.Divide {
            result = "\(Double(firstValue)! / Double(labelview.text!)!)"
        }else if currentOp == Operator.Minus {
            result = "\(Double(firstValue)! - Double(labelview.text!)!)"
        }else if currentOp == Operator.Add {
            result = "\(Double(firstValue)! + Double(labelview.text!)!)"
        }
        
        labelview.text = result
        calcState = CalcState.newNumbStart
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

