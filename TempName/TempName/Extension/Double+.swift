//
//  Double+.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/11.
//

import Foundation

extension Double {
    func errorRange(percent: Double) -> Double{
        return self + (self * (percent / 100))
    }
    
    func multiply(_ operand : Double) -> Double{
        return self * operand
    }
}
