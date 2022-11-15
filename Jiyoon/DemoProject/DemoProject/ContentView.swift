//
//  ContentView.swift
//  DemoProject
//
//  Created by 지윤 on 2022/11/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello Jiyoon")
                .font(.largeTitle)
                .foregroundColor(.green)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
        }
        
    }
}
