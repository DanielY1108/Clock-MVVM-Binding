//
//  ClockModelView.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/14.
//

import Foundation
import Combine

class ClockViewModel {
    
    // @Published를 통해 데이터를 제공해 준다.
    // 연산자 $를 통하여 Published에 속성에 접근할 수 있다
    @Published var combineTime: String = "Combine"

    func checkTime() {
        combineTime = Clock.currentTime()
    }
}
