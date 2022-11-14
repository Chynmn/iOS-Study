//
//  ContentView.swift
//  StackFrame
//
//  Created by 이정동 on 2022/11/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack{
                Text("Hello World, how are you?")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width/2, height: geometry.size.height/2, alignment: .topLeading)
            
                Text("Goodbye World")
                    .font(.largeTitle)
                    .frame(width: geometry.size.width/2, height: geometry.size.height/2, alignment: .bottomTrailing)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
