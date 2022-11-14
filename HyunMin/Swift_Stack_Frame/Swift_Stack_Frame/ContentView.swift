//
//  ContentView.swift
//  Swift_Stack_Frame
//
//  Created by /Chynmn/M1 pro—̳͟͞͞♡ on 2022/11/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "sun.max")
                Image(systemName: "cloud.rain")
                Image(systemName: "snowflake")
            }
            .padding(.all)  
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .padding(.bottom)
            
            VStack(alignment: .center, spacing: 15) {
                Text("Financial Results")
                    .font(.title)
                
                HStack(alignment: .top) {
                    Text("Q1 Sales")
                        .font(.headline)
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("January")
                        Text("February")
                        Text("March")
                    }
                    Spacer()
                    
                    VStack {
                        Text("$10000")
                        Text("$200")
                        Text("$3000")
                    }
                    .padding(5)
                }
                VStack {
                    Group {
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                            .padding(.bottom, 10)
                    }
                    
                    Group {
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                        Text("Sample Text")
                    }
                }
                .padding(5)
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
