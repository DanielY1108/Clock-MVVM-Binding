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
        // 2. 실행
        setBindings()
        startTimer()
    }
    
    // 4. 매 초마다 시간을 업데이트 (checkTime 실행)
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.viewModel.checkTime()
        }
    }
    
    // 3-2. 정의해 둔 bind 메서드를 통해서 text에 업데이트가 됩니다. (초기화된 값을 갖고 업데이트)
    func setBindings() {
        viewModel.observableTime.bind { [weak self] time in
            self?.observableTimeLabel.text = time
        }
    }
}
