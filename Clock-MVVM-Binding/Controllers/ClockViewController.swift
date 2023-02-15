//
//  ClockViewController.swift
//  Clock-MVVM-Binding
//
//  Created by JINSEOK on 2023/02/14.
//

import UIKit
import Combine

class ClockViewController: UIViewController {
    
    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var observableTimeLabel: UILabel!
    @IBOutlet weak var conbineTimeLabel: UILabel!
    
    // 메모리 관리를 위해 취소를 자동으로 해주는 AnyCancellable 만들어 준다.
    // (뷰컨이 해제되면 자동으로 cancel() 실행)
    var cancellables: Set<AnyCancellable> = []
    
    private var viewModel = ClockViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        startTimer()
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.viewModel.checkTime()
        }
    }
    
    func setBindings() {
        viewModel.$combineTime
             // compactMap을 통해 옵셔널을 제거해준다.
            .compactMap { String($0) }
            // assign은 keyPath형식으로 객체 접근하여 참조하는 방식이라고 하네요.
            // conbineTimeLabel의 text에 접근
            .assign(to: \.text, on: conbineTimeLabel)
            // 취소할 동작을 Set에 저장
            .store(in: &cancellables)
    }
}
