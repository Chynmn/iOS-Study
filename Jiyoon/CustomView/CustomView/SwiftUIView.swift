//
//  SwiftUIView.swift
//  CustomView
//
//  Created by 지윤 on 2022/11/14.
//

import SwiftUI

struct SwiftUIView: View {
    
    let carStack = HStack {
        Text("Car Image")
        Image(systemName: "car.fill")
    }
    
    var body: some View {
        Button(action: buttonPressed){
            Text("Click Me")
        }
        VStack {
            Text("Main Title")
                .font(.largeTitle)
            carStack
            Text("Text 1")
                .modifier(StandardTitle())
        }
    }
    func buttonPressed(){
        
    }
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.largeTitle)
            .background(Color.white)
            .border(Color.gray, width: 0.2)
            .shadow(color: Color.black, radius: 5, x:0, y:5)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping() -> Content){
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10){
            content()
        }
        .font(.largeTitle)
    }
}
