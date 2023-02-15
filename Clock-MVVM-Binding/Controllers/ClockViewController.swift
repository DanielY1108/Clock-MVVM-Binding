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
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    private var viewModel = ClockViewModel()
    
    private var cancellable: Set<AnyCancellable> = []
    
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
        viewModel.didChangeTime = { [weak self] viewModel in
            self?.closureTimeLabel.text = viewModel.closureTime
        }
        viewModel.obseravbleTime.bind { [weak self] text in
            self?.observableTimeLabel.text = text
        }
        viewModel.$combineTime
            .compactMap { String($0) }
            .assign(to: \.text, on: combineTimeLabel)
            .store(in: &cancellable)
    }
}

