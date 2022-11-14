//
//  ObservableObject.swift
//  State_Observable_Environment
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/13.
//

import Foundation
import Combine  // 프레임워크 안에 포함되어 있는 ObservableObject는 publisher와 subscriber 간의 관계를 쉽게 구축할 수 있도록 iOS 13에 도입.

/*
 ObservableObject는 published property로서 데이터 값을 publish하고, Observer object는 subscribe하여 게시된 프로퍼티가 변경될 때마다 업데이트를 받는다.
 property 선언 시 @Published 프로퍼티 래퍼를 사용. -> 래퍼 프로퍼티 값이 변경될 때마다 모든 구독자에게 업데이틀 알린다.
 */

/*
 Environment Object는 다른 뷰로 navigation하는데 해당 뷰에서도 동일한 구독 객체에 접근해야 할 때 참조체를 전달하는데 사용.
 Environment 객체는 Observable 객체와 같은 방식으로 선언하므로 ObservableObject 프로토콜을 따라야 하며, 적절한 프로퍼티가 게시되어야 한다.
 차이점은, 이 객체는 SwiftUI 환경에 저장되며,뷰에서 뷰로 전달할 필요없이 모든 뷰가 접근 할 수 있다는 점.
 @EnvironmentObject var demoData: DemoData 와 같이 프로퍼티 래퍼를 이용해 해당 객체를 참조한다.
 
 SwiftUI 프리뷰 캔버스 내에서 Environment 객체를 사용하려면 PreviewProvider 선언부에 있는 View 프로퍼티에
 .environmentObject(DemoData()) 를 추가하면, 이 객체는 구독 객체와 같은 동작을 하며, 모든 레이아웃 뷰가 접근할 수 있게 된다.
 */

class DemoData : ObservableObject {
    @Published var userCount = 0
    @Published var currentUser = ""
    
    init() {
        // 데이터를 초기화 하는 코드
        updateData()
    }
    
    func updateData() {
        // 데이터를 최신 상태로 유지하기 위한 코드
        currentUser = "chynmn"
        userCount += 1
        
    }
}
