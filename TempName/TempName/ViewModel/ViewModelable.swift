//
//  ViewModelable.swift
//  TempName
//
//  Created by youngkwanji on 2023/01/02.
//

import SwiftUI
import Combine
 
protocol ViewModelable : ObservableObject {
    associatedtype Action
    associatedtype State
    
    var state : State {get}
    func action(_ action : Action)
}
