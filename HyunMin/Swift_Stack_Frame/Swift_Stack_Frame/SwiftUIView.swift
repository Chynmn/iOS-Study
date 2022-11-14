//
//  SwiftUIView.swift
//  Swift_Stack_Frame
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/13.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image(systemName: "airplane")
                    Text("Flight times : ")
                    Text("London")
                        .layoutPriority(1)
                }
                .font(.largeTitle)
                .lineLimit(1)
                
                Text("Have a nice Flight!") // 최솟값, 최댓값 범위에서 제한하는 방법
                    .font(.largeTitle)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .border(Color.yellow, width: 5)
                Text("Hello World, ")   // GeometryReader를 사용하여 뷰 크기를 조절하는 방법
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2, height: (geometry.size.height / 4) * 2)
                    .border(Color.blue, width: 5)
                Text("how are you?")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width / 2, height: geometry.size.height / 4)
                    .border(Color.green, width: 5)
            }
//            .edgesIgnoringSafeArea(.all)    // 굳이 사용할 일 없을 듯
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
