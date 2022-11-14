//
//  ContentView.swift
//  State_Observable_Environment
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/13.
//

import SwiftUI

struct StateView: View {
    // state property -> view layout의 현재 상태를 저장하기 위해 사용. @State 프로퍼티 래퍼를 사용해 선언
    @State private var wifiEnabled = true
    @State private var userName = ""
    // 상태 값은 해당 뷰에 속하기 때문에 private 프로퍼티로 선언. 레이아웃에 있는 뷰와 바인딩 할 수 있음.
    // 바인딩 된 뷰에서 변경이 일어나면 해단 상태 프로퍼티에 자동 반영.
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Enabled Wi-Fi")
            }
            TextField("Enter user name", text: $userName)   // 상태 프로퍼티와 바인딩을 위해 $표시 사용
            Text(userName)  // $ 표시 없이 사용되었다는 점 주의.
            WifiImageView(wifiEnabled: $wifiEnabled)    // 하위 뷰가 호출될 때 상태 프로퍼티에 대한 바인딩 전달.
        }
    }
}

struct WifiImageView: View {    // 하위 뷰
    @Binding var wifiEnabled : Bool // 메인 뷰의 범위 밖에 있기 때문에 @Binding 프로퍼티 래퍼를 이용해 선언.
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")  // 토글 뷰와 상태 프로퍼티 바인딩
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
