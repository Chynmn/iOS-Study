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
        // 1. 컨테이너 정렬
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
        
        // 2. 정렬 가이드
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
        
        // 4. 커스텀 정렬 타입 -> 표준 정렬 타입을 확장
        // 방법 1 : 정렬에 적용될 값을 계산하기 위한 계산식이 포함된 정렬 가이드를 적용하는 방법
        // 방법 2 : 여러 뷰에 적용될 수 있는 커스텀 정렬을 생성
        HStack(alignment: .oneThird) {
            Rectangle()
                .foregroundColor(Color .green)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color .red)
                .alignmentGuide(.oneThird, computeValue: { d in d[VerticalAlignment.bottom]})
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color .blue)
                .frame(width: 50, height: 200)
            Rectangle()
                .foregroundColor(Color .orange)
                .alignmentGuide(.oneThird, computeValue: { d in d[VerticalAlignment.top]})
                .frame(width: 50, height: 200)
        }
        
        // 5. 스택 정렬 교차
        // 표준 정렬 타입의 단점 -> 스택 내의 뷰가 다른 스택에 있는 뷰와 정렬되도록 하는 방법을 제공하지 않는다.
        HStack(alignment: .crossAlignment, spacing: 20) {   // 중요! 서로 다른 스택에 포함된 뷰를 정렬하기 위해 사용
            // HStack 안에 VStack이 포함된 스택의 구성도. 원을 구성하는 뷰도 포함.
            Circle()
                .foregroundColor(Color .purple)
                .alignmentGuide(.crossAlignment, computeValue: { d in d[VerticalAlignment.center]})
                .frame(width: 100, height: 100)
            
            VStack(alignment: .center) {
                Rectangle()
                    .foregroundColor(Color .green)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(Color .red)
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(Color .blue)
                    .alignmentGuide(.crossAlignment, computeValue: { d in d[VerticalAlignment.center]})
                    .frame(width: 100, height: 100)
                Rectangle()
                    .foregroundColor(Color .orange)
                    .frame(width: 100, height: 100)
            }
        }
        
        // 6. ZStack : 뷰가 겹치도록 각각 위로 쌓이는 구조
        // 표준 정렬 타입으로는 스택에 속한 모든 뷰의 정렬이 바뀐다. -> 따라서 각 뷰가 자신만의 정렬을 갖도록하는 커스텀 뷰로 정렬.
        ZStack(alignment: .myAlignment) {
            Rectangle()
                .foregroundColor(Color .green)
//                .alignmentGuide(HorizontalAlignment.myAlignment) { d in d[.trailing] }
                .alignmentGuide(HorizontalAlignment.myAlignment) { d in d[.leading] }
                .alignmentGuide(VerticalAlignment.myAlignment) { d in d[VerticalAlignment.bottom] }
                .frame(width: 100, height: 100)
            Rectangle()
                .foregroundColor(Color .red)
//                .alignmentGuide(VerticalAlignment.myAlignment) { d in d[VerticalAlignment.top] }
//                .alignmentGuide(HorizontalAlignment.myAlignment) { d in d[HorizontalAlignment.center] }
                .alignmentGuide(VerticalAlignment.myAlignment) { d in d[VerticalAlignment.center] }
                .alignmentGuide(HorizontalAlignment.myAlignment) { d in d[HorizontalAlignment.trailing] }
                .frame(width: 100, height: 100)
            Circle()
                .foregroundColor(Color .orange)
                .alignmentGuide(HorizontalAlignment.myAlignment) { d in d[.leading] }
//                .alignmentGuide(VerticalAlignment.myAlignment) { d in d[.bottom] }
                .alignmentGuide(VerticalAlignment.myAlignment) { d in d[.top] }
                .frame(width: 100, height: 100)
        }
    }
}

// 4.커스텀정렬 - 계산된 값을 반환하는 새로운 정렬 타입을 추가하기 위하여 VerticalAlignment나 HorizontalAlignment를 확장하여 사용.
// extension에 AlignmentID 프로토콜을 따르는 enum을 포함하고, defaultValue()라는 이름의 함수가 수현되도록 지시.
// 이 함수는 뷰에 대한 ViewDimensions 객체를 받아야 하며, 정렬 가이드 위치를 가리키는 계산된 GCFloat 값을 반환해야 한다.
extension VerticalAlignment {
    private enum OneThird : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height / 3 // view 높이의 3분의 1 반환
        }
    }
    static let oneThird = VerticalAlignment(OneThird.self)
}

// 5. 원을 사각형에 맞춰 정렬하기 위해 커스텀 정렬 수행
extension VerticalAlignment {
    private enum CrossAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let crossAlignment = VerticalAlignment(CrossAlignment.self)
}

// 6. ZStack 커스텀 정렬 -> ZStack의 하위 뷰를 수직/수평으로 정렬하는데 사용.
// 수평 커스텀 정렬과 수직 커스텀 정렬 모두가 하나의 커스텀 정렬로 결합되어야 함.
extension HorizontalAlignment {
    enum MyHorizontal: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[HorizontalAlignment.center]
        }
    }
    static let myAlignment = HorizontalAlignment(MyHorizontal.self)
}

extension VerticalAlignment {
    enum MyVertical: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[VerticalAlignment.center]
        }
    }
    static let myAlignment = VerticalAlignment(MyVertical.self)
}

extension Alignment {
    static let myAlignment = Alignment(horizontal: .myAlignment, vertical: .myAlignment)
}

/*
 정리 : SwiftUI Stack Container View는 컨테이너를 기준으로 모든 하위 뷰의 위치를 조절하는 기본 정렬 설정을 이용하여 구성될 수 있다.
 스택에 속한 개별 뷰의 정렬은 alignmentGuide를 사용하여 할 수 있다. AlignmentGuide는 ViewDimenstions 객체가 전달되는 클로저를 포함하며,
 ViewDimensions 객체는 뷰의 높이와 폭을 기준으로 뷰의 위치를 계산하는데 사용된다. 이러한 alignmentGuide는 스택 뷰 레이아웃을 선언할 때 표준
 정렬과 동일한 방법으로 재사용될 수 있는 커스텀 정렬로 구현할 수도 있다.
 커스텀 정렬은 서로 다른 스택에 포함된 뷰들이 서로 정렬되어야 하는 경우에 매우 유용하다.
 ZStack의 하위 뷰에 대한 커스텀 정렬은 HorizontalAlignmentGuide와 VerticalAlignmentGuide 모두가 필요하다.
*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
