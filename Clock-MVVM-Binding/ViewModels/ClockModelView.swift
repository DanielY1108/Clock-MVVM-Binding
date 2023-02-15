//
//  ClockModelView.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/14.
//

import Foundation

class ClockViewModel {
    
    // 만들어 놓은 Observable 객체를 생성해줍시다.
    var observableTime: Observable<String> = Observable("기본값")
 
    init() {
        observableTime.value = Clock.currentTime()
    }
    
    // 5. value를 호출하여 시간을 업데이트되므로 didSet이 실행 됨
    // Observable은 String타입을 감싼 형태이므로 value를 통해 값을 저장한다.
    func checkTime() {
        observableTime.value = Clock.currentTime()
    }
}
