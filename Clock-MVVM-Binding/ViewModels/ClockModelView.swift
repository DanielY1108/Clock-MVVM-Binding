//
//  ClockModelView.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/14.
//

import Foundation

class ClockViewModel {
    
    // 수행될 동작을 담을 클로저 변수 생성 (어떠한 기능을 담는다)
    var didChangeTime: ((ClockViewModel) -> Void)?
    
    // 6-1. 매 초 마다 didChangeTime 클로저 호출
    // 즉, 아래에서 시간을 closureTime에 저장할 때마다 didSet 호출.
    // 어떠한 동작(didChangeTime)이 실행된다.
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    // 생성 시 현재 시간을 담아줍니다.
    init() {
        closureTime = Clock.currentTime()
    }
    
    // 5. 매 초마다 호출되면서 closureTime에 시간을 담아줍니다.
    func checkTime() {
        closureTime = Clock.currentTime()
    }
}
