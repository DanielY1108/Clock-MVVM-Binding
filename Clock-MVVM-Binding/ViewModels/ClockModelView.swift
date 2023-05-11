//
//  ClockModelView.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/14.
//

import Foundation
import Combine

class ClockViewModel {
    
    // MARK: - closure
    
    var didChangeTime: ((ClockViewModel) -> Void)?
    
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    
    // MARK: - obseravble

    var obseravbleTime: Observable<String> = Observable("Observable")
    
    init() {
        closureTime = Clock.currentTime()
    }
    
    // MARK: - combine

    @Published var combineTime: String = "Combine"
    
    // MARK: - method

    func checkTime() {
        closureTime = Clock.currentTime()
        obseravbleTime.value = Clock.currentTime()
        combineTime = Clock.currentTime()
    }
}
