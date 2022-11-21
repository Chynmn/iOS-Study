//
//  ContentView.swift
//  Stack_Alingning
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/19.
//
// 스택 정렬의 고급 기술 : 컨테이너 정렬, 정렬 가이드, 커스텀 정렬, 서로 다른 스택들 간의 정렬 구현
// 컨테이너 정렬에서 HStack은 하위 뷰를 수직방향 정렬을 하며, VStack은 하위 뷰를 수평 방향 정렬을 한다.
// ZStack의 경우는 수평/수직 정렬 값이 모두 사용된다.

/*
 alignment guide는 뷰가 스택에 포함된 다른 뷰와 정렬해야 할 때 사용되는 커스텀 포지션을 정의하는데 사용.
 표준 정렬 타입과 클로저를 인자로 받는 "alignmentGuide()" 수정자를 사용하여 뷰에 적용됨.
 클로저는 표준 정렬을 기준으로 하는 뷰 내에 위치(포인트)를 가리키는 값을 계산하여 반환한다.
 뷰 내의 정렬 위치 계산을 돕기 위하여 뷰의 폭과 높이를 얻는데 사용할 수 있는 ViewDimensions 객체와 뷰의 표준 정렬 위치가 클로저에세 전달.
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack (alignment: .leading) {
            // 특정 컨테이너 값을 지정하지 않으면 .center가 디폴트. .leading(왼쪽 정렬) .trailing(오른쪽 정렬)
            Text("This is some text")
            Text("This is some longer text")
            Text("This is short")
        }
        .font(.body)
        .border(.blue)
        .padding()
        
        HStack (alignment: .lastTextBaseline, spacing: 20) {
            // 역시 중앙 정렬이 디폴트. .firstTextBaseLine(상단 정렬) .lasrTextBaseLine(하단 정렬)
            Text("This is some text")
                .font(.largeTitle)
            Text("This is. ome much longer text")
                .font(.body)
            Text("This is short")
                .font(.headline)
        }
        .border(.blue)
        .padding()
        
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(Color .green)
                .frame(width: 120, height: 50)
            Rectangle()
                .foregroundColor(Color .red)
                .alignmentGuide(.leading, computeValue: { d in 120.0 })
            // 120포인트 왼쪽 정렬. 부모 스택에 적용된 정렬 타입과 일치해야 한다.
                .frame(width: 200, height: 50)
            Rectangle()
                .foregroundColor(Color .blue)
                .alignmentGuide(.leading, computeValue: { d in d[HorizontalAlignment.trailing] + 20})
            // ViewDimensions 객체는 뷰의 HorizontalAlignment와 VerticalAlignment 프로퍼티에 대한 접근을 제공한다.
                .frame(width: 180, height: 50)
            Rectangle()
                .foregroundColor(Color .purple)
                .alignmentGuide(.leading, computeValue: {d in d.width / 3})
            // offset 하드코딩 대신 클로저에 전달된 ViewDimensions 객체의 프로퍼티를 정렬 가이드 위치를 계산하는데 이용할 수 있다.
                .frame(width: 160, height: 50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
