//
//  Observable.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/15.
//

import Foundation

// 모든 타입을 사용할 수 있게 제네릭으로 만들어 주자.
class Observable<T> {
    
    // 클로저를 통해 동작을 담아줄 변수를 생성해 줍니다.
    private var listner: ((T) -> Void)?
    
    // 6. didSet이 실행되면 listner에 담아둔 동작을 value의 값을 갖고 실행합니다.
    // 7. 저장된 동작을 반복 실행 (Timer로 인해 매초 반복)
    var value: T {
        didSet {
            listner?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    // 3-1. bind 실행 시 클로저 안쪽의 동작들을 listner에 저장합니다. (어떠한 동작들을 저장)
    // 이 순간 클로저에 저장된 동작은 text를 업데이트하는 동작
    // 그리고 저장해 둔 동작을 실행됩니다.
    func bind(_ closure: @escaping (T) -> Void) {
        self.listner = closure
        self.listner?(value)
    }
}
