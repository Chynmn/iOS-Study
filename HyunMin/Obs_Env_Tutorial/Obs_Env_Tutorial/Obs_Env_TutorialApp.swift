//
//  Obs_Env_TutorialApp.swift
//  Obs_Env_Tutorial
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/15.
//

/* 이번 장에서 할 일 -> ObservableObject는 시간이 지남에 따라 반복적으로 변하는 데이터 값인 동적 데이터를 래핑하는데 사용될 때 특히 강력하다.
 이런 타입의 데이터를 시뮬레이션하기 위해서 Foundation 프레임워크의 Timer 객체를 사용하여 매 초마다 카운터가 업데이트 되도록 구성하여 Observable 데이터 객체를 생성한다.
 이 카운터는 앱 프로젝트 내의 뷰들이 볼 수 있도록 게시된다.
 
 데이터를 Observable 객체로 취급되어 다른 뷰로 전달하는 작업을 실습하고나서, 데이터를 Environment 객체로 전환하여 다른 뷰로 전달하지 않아도 다른 뷰들이 접근할 수 있게 한다.
 */

import SwiftUI

@main
struct Obs_Env_TutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//            SecondView(timerData: TimerData())
            ThirdView().environmentObject(TimerData())
//            FourthView().environmentObject(TimerData())
        }
    }
}
