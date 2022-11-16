//
//  CarStore.swift
//  ListNavDemo
//
//  Created by 이정동 on 2022/11/16.
//

import Foundation
import Combine



// 사용자 뷰에서 최신 데이터를 표시하기 위해 Observable 객체 사용
class CarStore: ObservableObject {
    // 최신 데이터를 유지하기 위해 Published 프로퍼티 사용
    @Published var cars: [Car]
    
    init(cars: [Car] = []) {
        self.cars = cars
    }
}
