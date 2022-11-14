//
//  ContentView.swift
//  DemoProject
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Sample Text")
                    .font(.custom("Copperplate", size: 50))
                    .modifier(customModifier())
                Text("Text 1")
                    .font(.headline)
                    .foregroundColor(.red)
                    .padding(.all)
                Text("Text 2")
            }
            MyHStackView()
                .font(.footnote)
                .padding(.all)
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)

                Text("Hello, world!")
                    .bold()
                    .padding(.all)
            }
            .border(Color.blue)
            Text("Goodbye World")
            MyVstack {
                Text("custom")
                Text("Container")
                HStack {
                    Text("this is")
                    Text("test")
                    Text("for lowwer view")
                }
            }
        }
    }
}

// 하위 뷰
struct MyHStackView: View {
    var body: some View {
        HStack {
            Text("Hello")
            Text(" how")
            Text(" are you?")
            VStack {
                Text("Main Title")
                    .font(.largeTitle)
                    .padding(.all)
                HStack {
                    Text("Car Image")
                }
            }
        }
    }
}

// 커스텀 수정자
struct customModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .background(Color.purple)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x: 3, y: 5)
    }
}

// 커스텀 컨테이너 뷰 -> ViewBuilder 클로저 형태를 취하며 여러 하위 뷰로 구성된 커스텀 뷰를 만드는데 사용
struct MyVstack<Content:View>: View {
//    var body: some View {사용할 곳마다 서로 다른 뷰를 담아야 하는 경우에 부적합
//        VStack(spacing: 10) {
//            Text("customContainer Item 1")
//            Text("customContainer Item 2")
//            Text("customContainer Item 3")
//        }
//        .font(.largeTitle)
//    }
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
