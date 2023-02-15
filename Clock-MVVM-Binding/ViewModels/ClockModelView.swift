//
//  ClockModelView.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/14.
//

import Foundation
import Combine

class ClockViewModel {
    
    var didChangeTime: ((ClockViewModel) -> Void)?
    
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    
    var obseravbleTime: Observable<String> = Observable("Observable")
    
    @Published var combineTime: String = "Combine"
    
    init() {
        closureTime = Clock.currentTime()
    }
    
    func checkTime() {
        closureTime = Clock.currentTime()
        obseravbleTime.value = Clock.currentTime()
        combineTime = Clock.currentTime()
    }
}
