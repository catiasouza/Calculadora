//
//  ViewController.swift
//  Calculadora
//
//  Created by Cátia Souza on 18/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var display: UILabel!
    private var isFinishedTypingNunmber: Bool = true
    
    private var displayValue: Double{
        get {
            guard let number = Double( display.text!) else{
                fatalError("Erro de conversao")
            }
            return number
        }
        set{
            display.text = String(newValue)
        }
    }
    private var calculator = CalculadoraLogica()
    
    @IBAction func calculaButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNunmber = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
           
            if let result =  calculator.calculate(symbol: calcMethod){
                displayValue = result
            }
            
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue  = sender.currentTitle{
            if isFinishedTypingNunmber{  //isFinishedTypingNunmber sera true qd for 0
                display.text = numValue
                isFinishedTypingNunmber = false
            }else{
                if numValue == "."{
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                display.text = display.text! + numValue
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
}

