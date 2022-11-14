//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by 이정동 on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    
    var color: [Color] = [.black, .red, .green, .blue]
    var colorNames = ["Black", "Red", "Green", "blue"]
    
    @State private var colorIndex = 0
    @State private var rotation: Double = 0
    @State private var text: String = "Welcome"
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(rotation) , \(text)")
                .font(.largeTitle)
                .lineLimit(1)
                .fontWeight(.light)
                .rotationEffect(.degrees(rotation))
                .animation(.easeInOut(duration: 1.5))
                .foregroundColor(color[colorIndex])
            
            Spacer()
            
            Slider(value: $rotation, in: 0...360, step: 0.1)
            Divider()
            TextField("TextField", text: $text)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            Picker(selection: $colorIndex) {
                ForEach(0 ..< colorNames.count) {
                    Text(colorNames[$0])
                        .foregroundColor(color[$0])
                        // pickerStyle: inline, wheel에서 적용됨
                }
            } label: {
                // pickerStyle: navigationLink에서 적용됨
                Image(systemName: "person")
            }
            .pickerStyle(.wheel)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
