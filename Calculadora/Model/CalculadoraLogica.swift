//
//  CalculadoraLogica.swift
//  Calculadora
//
//  Created by Cátia Souza on 18/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.


import Foundation


struct CalculadoraLogica {
    
    private  var number : Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double?{
        
        if let n = number{
           switch symbol {
           case "+/-":
                return n * -1
           case "AC":
                return 0
           case "%":
                return n / 100
           case"=":
              return performTwoNumberCalculation(n2: n)
           default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    private func performTwoNumberCalculation(n2: Double) -> Double?{
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "X":
                return n1 * n2
            case "/":
                return n1 / n2
                
            default:
                fatalError("Operacao invalida")
            }
        }
        return nil
    }
}
