//
//  ClockViewController.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/14.
//

import UIKit

class ClockViewController: UIViewController {
    
    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var observableTimeLabel: UILabel!
    @IBOutlet weak var conbineTimeLabel: UILabel!
    
    // 1. 뷰 모델 생성(이 때 didSet이 호출해도 동작이 실행되지 않음)
    // 코드가 먼저 메모리에 올라간 뒤 viewDidLoad를 업데이트 시키키 때문.
    private var viewModel = ClockViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 2. 실행 (didSet 호출은 없으므로 아직 동작은 안됨)
        setBindings()
        startTimer()
    }
    
    // 4. 매 초마다 시간을 업데이트 (checkTime 실행)
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.viewModel.checkTime()
        }
    }
    
    // 3. 어떠한 행동은 이와같이 저장 된다.(didChangeTime에 클로저의 동작을 담아 저장 시킨다)
    func setBindings() {
        // 6-2. 실행이 되면 text에 시간을 업데이트 시킨다. (실행 시점은 didSet이 동작 될 타이밍에 업데이트)
        // 6-3. 매 초마다 값이 업데이트 된다.
        viewModel.didChangeTime = { [weak self] viewModel in
            self?.closureTimeLabel.text = viewModel.closureTime
        }
    }
}
