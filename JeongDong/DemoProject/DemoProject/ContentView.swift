//
//  ContentView.swift
//  DemoProject
//
//  Created by 이정동 on 2022/11/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyVStack {
            Text("myVStack1")
            Text("myVStack2")
            Text("myVStack3")
        }
    }
    
}

struct StandardTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .background(.red)
            .border(.blue, width: 0.2)
            .shadow(color: .black, radius: 5, x: 0, y: 5)
    }
}

struct MyVStack<Content: View>: View {
    let content : () -> Content
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

