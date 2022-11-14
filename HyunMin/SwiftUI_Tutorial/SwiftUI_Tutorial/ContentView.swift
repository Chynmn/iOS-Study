//
//  ContentView.swift
//  SwiftUI_Tutorial
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/13.
//

import SwiftUI

struct ContentView: View {
    // Picker를 통해 Text뷰의 글자 색상을 사용자가 선택할 수 있게 하는 것.
    var colors: [Color] = [.black, .red, .green, .blue] // 색상이름 배열 및 객체 배열
    var colornames = ["Black", "Red", "Green", "Blue"]
    
    @State private var colorIndex1 = 0   // 배열 인덱스 값을 저장하기 위한 상태 프로퍼티
    @State private var colorIndex2 = 0
    @State private var rotation: Double = 0 // 슬라이더와 바인딩을 하기 위함.
    @State private var text: String = "Welcome to SwiftUI"  // Stack에 TextField 뷰 추가.
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            VStack {
                Spacer()
                Text("Hello, world!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(self.rotation))
                // 회전에 대한 상태 프로퍼티에 할당된 값을 읽는 것이므로 프로퍼티 앞에 $를 붙이지 않음.
                    .animation(.easeInOut(duration: 2))
                    .foregroundColor(self.colors[self.colorIndex1])
                Spacer()
                
                Picker(selection: $colorIndex1, label: Text("Color")) {  // 사용자가 선택하는 기능.
                    ForEach (0 ..< colornames.count) {
                        Text(self.colornames[$0])
                            .foregroundColor(self.colors[$0])
                    }
                }
                Spacer()    // 뷰간 간격 맞춤 기능
                Divider()   // 뷰를 구분하기 위한 라인
                
                Slider(value: $rotation, in: 0...360, step: 0.1) // 뷰를 회전시킬 용도
                    .padding()
                
                Text(text)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotationEffect(.degrees(self.rotation))
                    .animation(.easeInOut(duration: 2))
                    .foregroundColor(self.colors[self.colorIndex2])
                    .padding()
                
                TextField("Enter text here", text: $text)
                // 사용자가 입력하는 텍스트가 저장될 상태 프로퍼티와 이 프로퍼티를 이용하여 Text 뷰를 변경함.
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                // 사용자가 TextField 뷰에 텍스트를 입려하면  text 상태 프로퍼티에 저장되고 바인딩에 의해 Text뷰에 자동으로 나타남.
                    .padding()
                
                Picker(selection: $colorIndex2, label: Text("Color")) {  // 사용자가 선택하는 기능.
                    ForEach (0 ..< colornames.count) {
                        Text(self.colornames[$0])
                            .foregroundColor(self.colors[$0])
                    }
                }
                .padding()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
