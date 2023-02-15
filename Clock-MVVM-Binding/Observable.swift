//
//  Observable.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/15.
//

import Foundation

class Observable<T> {
    
    private var listner: ((T) -> Void)?
    
    var value: T {
        didSet {
            listner?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        self.listner = closure
        self.listner?(value)
    }
}
