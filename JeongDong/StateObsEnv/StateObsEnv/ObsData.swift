//
//  ObsData.swift
//  StateObsEnv
//
//  Created by 이정동 on 2022/11/11.
//

import Foundation
import Combine

class ObsData : ObservableObject {
    @Published var userCount = 0
    @Published var currentUser = "Unknown"
    
    init() {
        updateData()
    }
    
    func updateData() {
        print("데이터 업데이트")
    }
}
