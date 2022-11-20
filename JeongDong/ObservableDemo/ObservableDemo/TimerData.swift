//
//  TimerData.swift
//  ObservableDemo
//
//  Created by 이정동 on 2022/11/20.
//

import Foundation
import Combine

class TimerData: ObservableObject {
    @Published var timeCount = 0
    var timer: Timer?
    
    init() {
        // 매 초마다 timeDidFire() 함수를 호출하도록 초기화됨
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    @objc func timerDidFire() {
        timeCount += 1
    }
    
    func resetCount() {
        timeCount = 0
    }
}
